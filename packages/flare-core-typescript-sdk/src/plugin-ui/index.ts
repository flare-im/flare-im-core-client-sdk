import { pluginFormErrors, pluginViewExtras, type PluginActionOutcome, type PluginCardPresentation, type PluginDetailPage, type PluginDetailPresentation, type PluginPresentation } from "./view";
export * from "./view";
/** Runtime adaptation only. Rust owns schema evaluation, lease/permission
 * checks, action declaration and history fallback on every platform. */
export interface PluginUiPort {
  catalog(): Promise<unknown>;
  resolveMessage(payload: unknown): Promise<unknown>;
  action(payload: unknown): Promise<unknown>;
  /** `capability.plugin_ui_present`: Core reads the catalog itself and, given `messageId`,
   * resolves the card over the shared and local state layers stored on that message.
   * Request: `{message, messageId?, platform, locale, kind}`. */
  presentMessage(request: Record<string, unknown>): Promise<unknown>;
  /** `capability.plugin_ui_invoke`: given `messageId`, Core stores a successful result's
   * `data.sharedState` (this card's entity) and `data.messageState` on that message and emits a
   * message update. Request adds `actionId`, `userGesture`, `conversationId?`, `nativeAllowlist`,
   * `formValues?` and `selection?` to the present fields. */
  invokeAction(request: Record<string, unknown>): Promise<unknown>;
  /** `capability.plugin_detail`: the card's "view all" sheet. Request:
   * `{message, messageId?, conversationId?, platform, locale, userGesture, cursor?, previous?, refresh?}`; returns
   * the resolved view, with `nextCursor` while a paged detail has more. With `cursor` and `previous` Core
   * fetches the next page and returns it appended to `previous`; with `refresh: true` and `previous` it
   * re-reads the sheet from the first page, as many pages as `previous` had loaded. */
  pluginDetail?(request: Record<string, unknown>): Promise<unknown>;
  dispatch(request: { capabilityId: string; payload: unknown; conversationId?: string; tenantId?: string; userId?: string }): Promise<unknown>;
}
export interface PluginMessageEnvelope {
  pluginId: string; contributionId: string; schemaVersion: number;
  summary: string; payload: Record<string, unknown>;
  /** The plugin's name, written by the platform when it posts the card; for inert cards to name their plugin. */
  displayName?: string;
}
export type PluginPlatform = "web" | "tauri" | "android" | "ios" | "flutter" | "harmonyos";
/** Core's rule for a card's `messageId`: non-empty, at most 256 bytes, no whitespace or control characters. */
export function validPluginMessageId(id: string): boolean {
  return id.length > 0 && new TextEncoder().encode(id).length <= 256 && !/[\s\p{Cc}]/u.test(id);
}
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
  /**
   * Present a stored message's card through Core. With a valid `messageId`, Core resolves the card
   * over the state layers stored on that message (payload, then the shared layer Core publishes,
   * then the viewer's local layer), so `data` and the view (fields, blocks, `hiddenWhen`) see them.
   * The v2 members (`blocks`, `inputs`, `detail`, `sharedStateVersion`) are present only when set.
   * A message id Core would refuse is left out rather than failing the whole card.
   */
  async present(message: PluginMessageEnvelope, messageId?: string,
    kind: "message-content" | "message-action" | "conversation-menu" | "composer-action" | "page" = "message-content"): Promise<PluginCardPresentation> {
    const generation = this.generation;
    const fallback = (): PluginCardPresentation => ({ ...this.fallback(message.summary), stateVersion: 0 });
    try {
      const value = await this.port.presentMessage({ message, ...(messageId && validPluginMessageId(messageId) ? { messageId } : {}),
        platform: this.platform, locale: this.locale(), kind });
      if (generation !== this.generation) return fallback();
      const view = value as PluginCardPresentation | null;
      if (!view || typeof view.available !== "boolean" || typeof view.title !== "string" || !Array.isArray(view.fields) || !Array.isArray(view.actions)) return fallback();
      const stateVersion = Number.isSafeInteger(view.stateVersion) && view.stateVersion >= 0 ? view.stateVersion : 0;
      const shared = view.sharedStateVersion;
      const sharedStateVersion = typeof shared === "number" && Number.isSafeInteger(shared) && shared > 0 ? shared : undefined;
      const data = view.available && view.data && typeof view.data === "object" && !Array.isArray(view.data) ? view.data : undefined;
      return { available: view.available, title: view.title, fields: view.fields, actions: view.actions,
        ...pluginViewExtras(view as unknown as Record<string, unknown>), stateVersion,
        ...(sharedStateVersion ? { sharedStateVersion } : {}), ...(data ? { data } : {}) };
    } catch { return fallback(); }
  }
  /**
   * Run a card action through Core, which refreshes the grant and binds the declared input over the
   * merged card data. An action with a `form` takes `formValues` ({inputId: value}); Core validates
   * them first and returns `formErrors` without sending anything. A choices action takes
   * `selection` (option indices). With `messageId` Core persists the result's `data.sharedState`
   * and `data.messageState` on that message. Operation targets return the capability response;
   * page and native targets run here, as `invoke` does.
   */
  async invokeAction(message: PluginMessageEnvelope, actionId: string,
    options: { messageId?: string; conversationId?: string; userGesture: boolean; formValues?: Record<string, unknown>; selection?: number[] }): Promise<PluginActionOutcome> {
    const generation = this.generation;
    const { messageId, conversationId, userGesture, formValues, selection } = options;
    const value = await this.port.invokeAction({ message, ...(messageId && validPluginMessageId(messageId) ? { messageId } : {}),
      ...(conversationId ? { conversationId } : {}), platform: this.platform, actionId, userGesture, nativeAllowlist: this.native?.capabilities ?? [],
      ...(formValues ? { formValues } : {}), ...(selection ? { selection } : {}) });
    if (generation !== this.generation) throw new Error("Plugin session changed");
    const result = value as { kind?: unknown; response?: unknown; errors?: unknown; target?: { kind: string; page?: string; capability?: string }; payload?: Record<string, unknown> } | null;
    if (result?.kind === "operation" && result.response && typeof result.response === "object") {
      return { kind: "operation", response: result.response as Extract<PluginActionOutcome, { kind: "operation" }>["response"] };
    }
    if (result?.kind === "formErrors") return { kind: "formErrors", errors: pluginFormErrors(result.errors) };
    const target = result?.kind === "host" ? result.target : undefined;
    if (target?.kind === "page" && typeof target.page === "string" && this.navigate) return { kind: "host", result: this.navigate(target.page) };
    if (target?.kind === "native" && typeof target.capability === "string" && this.native?.capabilities.includes(target.capability as never)) {
      return { kind: "host", result: await this.native.invoke(target.capability, result?.payload ?? {}) };
    }
    throw new Error("Plugin target unavailable");
  }
  /**
   * The card's "view all" sheet: Core runs the contribution's detail operation with the input bound
   * over the merged card data and resolves the detail document against its result. A paged detail
   * carries `nextCursor` while it has more; pass `page: { cursor: sheet.nextCursor, previous: sheet }`
   * to load the next page: Core appends it to `previous` (entries continue in order, the rest stays
   * as on the first page) and returns the merged sheet, so hosts never merge pages.
   *
   * To re-read the sheet on show (after a state change, say), pass `refresh: sheet`: Core reads the
   * first page again and as many more as the sheet had loaded (at most 10 pages), and the result
   * replaces the sheet wholesale, with `nextCursor` while more remain. `page` and `refresh` exclude
   * each other. Throws when the port has no detail call, the plugin fails (on a refresh: keep showing
   * the sheet), or the session changed meanwhile.
   */
  async detail(message: PluginMessageEnvelope, options: { messageId?: string; conversationId?: string; userGesture: boolean; page?: PluginDetailPage; refresh?: PluginDetailPresentation }): Promise<PluginDetailPresentation> {
    const generation = this.generation;
    if (!this.port.pluginDetail) throw new Error("Plugin detail unavailable");
    const { messageId, conversationId, userGesture, page, refresh } = options;
    if (page && refresh) throw new Error("Plugin detail: page and refresh exclude each other");
    const value = await this.port.pluginDetail({ message, ...(messageId && validPluginMessageId(messageId) ? { messageId } : {}),
      ...(conversationId ? { conversationId } : {}), platform: this.platform, locale: this.locale(), userGesture,
      ...(page ? { cursor: page.cursor, previous: page.previous } : {}), ...(refresh ? { refresh: true, previous: refresh } : {}) });
    if (generation !== this.generation) throw new Error("Plugin session changed");
    const view = value as PluginDetailPresentation | null;
    if (!view || typeof view.available !== "boolean" || typeof view.title !== "string" || !Array.isArray(view.fields) || !Array.isArray(view.actions)) {
      throw new Error("Plugin detail unavailable");
    }
    const nextCursor = typeof view.nextCursor === "string" && view.nextCursor ? view.nextCursor : undefined;
    return { available: view.available, title: view.title, fields: view.fields, actions: view.actions,
      ...pluginViewExtras(view as unknown as Record<string, unknown>), ...(nextCursor ? { nextCursor } : {}) };
  }
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
