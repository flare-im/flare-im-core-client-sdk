/** Runtime adaptation only. Rust owns schema evaluation, lease/permission
 * checks, action declaration and history fallback on every platform. */
export interface PluginUiPort {
  catalog(): Promise<unknown>;
  resolveMessage(payload: unknown): Promise<unknown>;
  action(payload: unknown): Promise<unknown>;
  dispatch(request: { capabilityId: string; payload: unknown; conversationId?: string; tenantId?: string; userId?: string }): Promise<unknown>;
}
export interface PluginMessageEnvelope {
  pluginId: string; contributionId: string; schemaVersion: number;
  summary: string; payload: Record<string, unknown>;
}
export interface PluginPresentation {
  available: boolean; title: string;
  fields: Array<{ label: string; value: string }>;
  actions: Array<{ id: string; label: string }>;
}
export type PluginPlatform = "web" | "tauri" | "android" | "ios" | "flutter" | "harmonyos";
export interface NativePluginBridge {
  capabilities: ReadonlyArray<"selectImage" | "selectFile" | "camera" | "microphone" | "clipboardWrite">;
  invoke(capability: string, payload: Record<string, unknown>): Promise<unknown>;
}
export class PluginUiSession {
  private generation = 0;
  private catalogInFlight: Promise<unknown> | null = null;
  constructor(private readonly port: PluginUiPort, readonly platform: PluginPlatform,
    private readonly locale: () => string = () => "en-US", private readonly native?: NativePluginBridge, private readonly navigate?: (page: string) => void) {}
  reset(): void { this.generation++; this.catalogInFlight = null; }
  private catalogForView(): Promise<unknown> {
    if (this.catalogInFlight) return this.catalogInFlight;
    const pending = this.port.catalog();
    this.catalogInFlight = pending;
    const clear = () => { if (this.catalogInFlight === pending) this.catalogInFlight = null; };
    void pending.then(clear, clear);
    return pending;
  }
  /** Source serialization uses UTF-8 byte arrays for CustomElem.payload. */
  envelope(content: Record<string, unknown>): PluginMessageEnvelope | null {
    const bytes = content.payload;
    if (!Array.isArray(bytes) || bytes.length > 65536 || bytes.some((v) => !Number.isInteger(v) || v < 0 || v > 255)) return null;
    try {
      const value: unknown = JSON.parse(new TextDecoder("utf-8", { fatal: true }).decode(Uint8Array.from(bytes)));
      if (!value || typeof value !== "object") return null;
      const message = value as PluginMessageEnvelope;
      return typeof message.pluginId === "string" && typeof message.contributionId === "string" && typeof message.summary === "string" && message.payload && typeof message.payload === "object" ? message : null;
    } catch { return null; }
  }
  async resolve(message: PluginMessageEnvelope, kind: "message-content" | "message-action" | "conversation-menu" | "composer-action" | "page" = "message-content"): Promise<PluginPresentation> {
    const generation = this.generation;
    try {
      // A timeline can mount hundreds of cards together. Coalesce concurrent
      // reads only; retain no positive authorization cache after completion.
      const catalog = await this.catalogForView();
      if (generation !== this.generation) return this.fallback(message.summary);
      const result = await this.port.resolveMessage({ catalog, message, platform: this.platform, kind, locale: this.locale() });
      if (generation !== this.generation) return this.fallback(message.summary);
      const view = result as PluginPresentation;
      if (!view || typeof view.available !== "boolean" || typeof view.title !== "string" || !Array.isArray(view.fields) || !Array.isArray(view.actions)) return this.fallback(message.summary);
      return view;
    } catch { return this.fallback(message.summary); }
  }
  fallback(summary: string): PluginPresentation { return { available: false, title: summary.slice(0, 256), fields: [], actions: [] }; }
  async invoke(message: PluginMessageEnvelope, actionId: string, userGesture: boolean): Promise<unknown> {
    const generation = this.generation;
    const catalog = await this.port.catalog(); // Recheck latest grant before each action.
    const value = await this.port.action({ catalog, platform: this.platform, pluginId: message.pluginId,
      contributionId: message.contributionId, actionId, userGesture, payload: message.payload, nativeAllowlist: this.native?.capabilities ?? [] });
    if (generation !== this.generation) throw new Error("Plugin session changed");
    const prepared = value as { target: { kind: string; operation?: string; page?: string; capability?: string }; payload: Record<string, unknown> };
    const target = prepared.target;
    switch (target.kind) {
      case "operation":
        if (typeof target.operation !== "string") break;
        return this.port.dispatch({ capabilityId: target.operation, payload: prepared.payload });
      case "page":
        if (typeof target.page !== "string" || !this.navigate) break;
        return this.navigate(target.page);
      case "native":
        if (typeof target.capability !== "string" || !this.native || !this.native.capabilities.includes(target.capability as never)) break;
        return this.native.invoke(target.capability, prepared.payload);
    }
    throw new Error("Plugin target unavailable");
  }
}
