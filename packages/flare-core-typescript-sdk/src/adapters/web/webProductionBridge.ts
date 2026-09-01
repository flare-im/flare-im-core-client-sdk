import type { NativeBridge, NativeCallDescriptor } from "../../contract";
import {
  wireDecodeResponse,
  wireEncodeRequest,
} from "../../adapter/codec/wireCodec";
import {
  eventTypeForWebChannel,
  nativeEventFromCode,
} from "../../adapter/module/DefaultEventsApi";
import { FlareSdkException } from "../../bridge/flareSdkException";
import type { FlareWasmRuntime } from "../../bridge/wasmNativeBridge";
import {
  createWasmIndexedDbStorageHost,
  type WasmStorageHostCallbacks,
} from "./idbWasmStorageHost";

/**
 * Loads the WASM core runtime. Injected by the host because asset resolution is
 * bundler-specific (e.g. Vite `import.meta.env.BASE_URL` + public dir layout), which
 * is an app/bundler concern, not reusable SDK infra.
 */
export type WasmRuntimeLoader = () => Promise<{ runtime: FlareWasmRuntime }>;

/**
 * Builds the storage host backing the WASM core's `setStorageHost` callbacks.
 * Defaults to IndexedDB; desktop hosts (Electron) inject a SQLite-backed host
 * (wa-sqlite + OPFS) so packaged PC apps persist to SQLite instead of IndexedDB.
 */
export type WasmStorageHostFactory = () => WasmStorageHostCallbacks | Promise<WasmStorageHostCallbacks>;

export interface WebProductionBridgeOptions {
  /** Host-injected WASM runtime loader. Required before the first real `invoke`. */
  loadRuntime?: WasmRuntimeLoader;
  /** Host-injected storage backend factory. Defaults to IndexedDB. */
  createStorageHost?: WasmStorageHostFactory;
}

type EventEmitter = { emit(event: unknown): void };

type WasmEventEnvelope = {
  channel: string;
  payload: unknown;
};

type BrowserConnectionState = "disconnected" | "connecting" | "connected" | "ready" | "reconnecting";

function isBestEffortControlOperation(operation: string): boolean {
  return operation === "message.typing";
}

/**
 * 链条等待底层 WASM 调用真正结束时，额外给的宽限期。
 *
 * 外层 `withInvokeTimeout` 只负责回复调用方；`invokeChain` 仍要等底层调用
 * 真正 settle，否则下一次调用会在 wasm32 上重入 Tokio 的 block_on。
 * 但这个等待**不能无上界**——见 `awaitRuntimeSettledBounded`。
 */
const RUNTIME_SETTLE_GRACE_MS = 5_000;

function invokeTimeoutMs(operation: string): number {
  if (operation === "sdk.login") return 120_000;
  if (operation === "sdk.init") return 30_000;
  if (operation === "message.send" || operation === "message.send_no_oss") return 30_000;
  if (operation === "sync.conversation_history_backfill") return 30_000;
  if (operation.startsWith("sync.") || operation === "conversation.open_timeline") return 8_000;
  if (operation === "conversation.update_draft") return 5_000;
  if (operation === "message.typing") return 1_500;
  return 12_000;
}

function asRecord(value: unknown): Record<string, unknown> {
  return value && typeof value === "object" && !Array.isArray(value)
    ? value as Record<string, unknown>
    : {};
}

function normalizeConnectionState(value: unknown, operation: string): BrowserConnectionState {
  const state = String(value ?? "").trim();
  switch (state.toLowerCase()) {
    case "connecting":
      return "connecting";
    case "connected":
      return "connected";
    case "ready":
      return "ready";
    case "reconnecting":
      return "reconnecting";
    case "disconnected":
      return "disconnected";
    default:
      throw new FlareSdkException(
        "invalidParameter",
        `invalid connection state: ${state || "<empty>"}`,
        operation,
        { field: "state" },
      );
  }
}

export function mapWasmEventForTesting(channel: string, payload: unknown): unknown {
  const eventType = eventTypeForWebChannel(channel);
  return eventType === undefined ? wireDecodeResponse(payload) : nativeEventFromCode(eventType, payload);
}

export function encodeWasmRequestForTesting(request: unknown): unknown {
  return wireEncodeRequest(request);
}

export function isBestEffortControlOperationForTesting(operation: string): boolean {
  return isBestEffortControlOperation(operation);
}

type WasmRuntimeWithHost = FlareWasmRuntime & {
  setEventCallback?: (cb: ((event: unknown) => void) | null) => void;
  setStorageHost?: (
    loadSnapshot: (payload: unknown) => Promise<string>,
    saveMessage: (payload: unknown) => Promise<void>,
    saveConversation: (payload: unknown) => Promise<void>,
    saveCursor: (payload: unknown) => Promise<void>,
    savePendingSend: (payload: unknown) => Promise<void>,
    deleteMessage: (payload: unknown) => Promise<void>,
    deleteConversation: (payload: unknown) => Promise<void>,
    deletePendingSend: (payload: unknown) => Promise<void>,
  ) => void;
};

/** Browser production bridge: real WASM IMClient + WebSocket transport. */
export class WebProductionBridge implements NativeBridge {
  private runtime: WasmRuntimeWithHost | null = null;
  private eventsApi: EventEmitter | null = null;
  private eventsStarted = false;
  private lastConnectionState: BrowserConnectionState = "disconnected";
  private bestEffortControlInFlight = new Set<string>();
  /** Serialize WASM invoke — Tokio block_on must not re-enter on wasm32. */
  private invokeChain: Promise<void> = Promise.resolve();
  private readonly loadRuntime?: WasmRuntimeLoader;
  private readonly createStorageHost: WasmStorageHostFactory;

  constructor(options: WebProductionBridgeOptions = {}) {
    this.loadRuntime = options.loadRuntime;
    this.createStorageHost = options.createStorageHost ?? createWasmIndexedDbStorageHost;
  }

  attachEventEmitter(api: EventEmitter): void {
    this.eventsApi = api;
  }

  private async ensureRuntime(): Promise<WasmRuntimeWithHost> {
    if (this.runtime) {
      return this.runtime;
    }
    if (!this.loadRuntime) {
      throw new FlareSdkException(
        "wasm.loader_missing",
        "WebProductionBridge requires a WASM runtime loader. Pass { loadRuntime } when constructing it.",
      );
    }
    const loaded = await this.loadRuntime();
    const runtime = loaded.runtime as WasmRuntimeWithHost;
    const host = await this.createStorageHost();
    runtime.setStorageHost?.(
      (payload) => host.loadSnapshot(payload as { userId?: string }),
      (payload) => host.saveMessage(payload as Parameters<typeof host.saveMessage>[0]),
      (payload) => host.saveConversation(payload as Parameters<typeof host.saveConversation>[0]),
      (payload) => host.saveCursor(payload as Parameters<typeof host.saveCursor>[0]),
      (payload) => host.savePendingSend(payload as Parameters<typeof host.savePendingSend>[0]),
      (payload) => host.deleteMessage(payload as Parameters<typeof host.deleteMessage>[0]),
      (payload) => host.deleteConversation(payload as Parameters<typeof host.deleteConversation>[0]),
      (payload) => host.deletePendingSend(payload as Parameters<typeof host.deletePendingSend>[0]),
    );
    this.runtime = runtime;
    runtime.setEventCallback?.((raw: unknown) => {
      this.handleWasmEvent(raw);
    });
    return runtime;
  }

  private handleWasmEvent(raw: unknown): void {
    if (!this.eventsApi || typeof raw !== "object" || raw === null) {
      return;
    }
    const envelope = raw as WasmEventEnvelope;
    if (!envelope.channel) {
      return;
    }
    const mapped = mapWasmEventForTesting(envelope.channel, envelope.payload);
    if (mapped === undefined) {
      return;
    }
    this.captureConnectionState(mapped);
    this.eventsApi.emit(mapped);
  }

  private async ensureEventPipeline(): Promise<void> {
    if (this.eventsStarted) {
      return;
    }
    await this.ensureRuntime();
    this.eventsStarted = true;
  }

  private captureConnectionState(event: unknown): void {
    const record = asRecord(event);
    if (record.state !== undefined) {
      this.lastConnectionState = normalizeConnectionState(record.state, "event.decode");
    }
  }

  private hasUsableConnection(): boolean {
    return this.lastConnectionState === "connected" || this.lastConnectionState === "ready";
  }

  private captureInvokeFailureState(operation: string, error: unknown): void {
    const text = error instanceof Error ? error.message : String(error);
    if (/NOT_CONNECTED|未连接|CLOSING|CLOSED|connection.*closed/i.test(text)) {
      this.lastConnectionState = operation === "sdk.login" ? "disconnected" : "reconnecting";
    }
  }

  private async invokeRuntimeOperation<T>(operation: string, request?: unknown): Promise<T> {
    const runtime = await this.ensureRuntime();
    const encodedRequest = request === undefined || typeof request === "string"
      ? request
      : wireEncodeRequest(request);
    const payload =
      encodedRequest === undefined
        ? "{}"
        : typeof encodedRequest === "string"
          ? encodedRequest
          : JSON.stringify(encodedRequest);
    const result = await runtime.invoke(operation, payload);
    return this.decodeOperationResult<T>(operation, result);
  }

  private async withInvokeTimeout<T>(operation: string, task: Promise<T>): Promise<T> {
    const timeoutMs = invokeTimeoutMs(operation);
    let timer: ReturnType<typeof setTimeout> | undefined;
    try {
      return await Promise.race([
        task,
        new Promise<never>((_, reject) => {
          timer = setTimeout(() => {
            reject(new FlareSdkException(
              "wasm.invoke_timeout",
              `WASM operation ${operation} timed out after ${timeoutMs}ms`,
              operation,
              { timeoutMs: String(timeoutMs) },
            ));
          }, timeoutMs);
        }),
      ]);
    } finally {
      if (timer) {
        clearTimeout(timer);
      }
    }
  }

  private async invokeBestEffortControl<T>(operation: string, request?: unknown): Promise<T> {
    if (!this.hasUsableConnection() || this.bestEffortControlInFlight.has(operation)) {
      return undefined as T;
    }
    this.bestEffortControlInFlight.add(operation);
    try {
      return await this.invokeRuntimeOperation<T>(operation, request);
    } catch (error) {
      this.captureInvokeFailureState(operation, error);
      return undefined as T;
    } finally {
      this.bestEffortControlInFlight.delete(operation);
    }
  }

  private decodeOperationResult<T>(operation: string, result: unknown): T {
    const decoded = wireDecodeResponse(result);
    switch (operation) {
      case "sdk.login":
        this.lastConnectionState = this.hasUsableConnection() ? this.lastConnectionState : "ready";
        return decoded as T;
      case "connection.get_state": {
        const runtimeState = normalizeConnectionState(decoded, operation);
        this.lastConnectionState = runtimeState;
        return runtimeState as T;
      }
      case "sdk.is_connected":
      case "sdk.session_active":
        return (decoded === true || this.hasUsableConnection()) as T;
      case "sdk.logout":
      case "sdk.dispose":
      case "sdk.hard_reset":
      case "connection.disconnect":
        this.lastConnectionState = "disconnected";
        return decoded as T;
      default:
        return decoded as T;
    }
  }

  /**
   * 有界地等待底层 WASM 调用结束。
   *
   * 线上缺陷：只要有一次 WASM 调用永不返回，`invokeChain` 就被**永久**卡住，
   * 之后每一个 SDK 操作都排在它后面出不来。实测表现是"打开会话后只有第一条
   * 消息能发出，之后每条都 30s 超时且从未到达服务端，连切换会话也没有反应"
   * （view_timeline_open 25 秒都不发生），只能刷新页面。
   * 外层超时只是回复了调用方，链条本身还锁着。
   *
   * 超过宽限期就不再等：丢掉这个 runtime 实例。`ensureRuntime` 会重建一个新的，
   * 挂住的那次调用留在被抛弃的旧实例里，不会与后续调用共享，
   * 因此不存在 block_on 重入的风险。
   */
  private async awaitRuntimeSettledBounded(
    operation: string,
    settled: Promise<void>,
  ): Promise<void> {
    const graceMs = invokeTimeoutMs(operation) + RUNTIME_SETTLE_GRACE_MS;
    let timer: ReturnType<typeof setTimeout> | undefined;
    let timedOut = false;
    await Promise.race([
      settled,
      new Promise<void>((resolve) => {
        timer = setTimeout(() => {
          timedOut = true;
          resolve();
        }, graceMs);
      }),
    ]);
    if (timer) {
      clearTimeout(timer);
    }
    if (!timedOut) {
      return;
    }
    console.error(
      `[flare-core] WASM operation "${operation}" never settled after ${graceMs}ms; `
      + "dropping the runtime so later calls are not blocked forever",
    );
    this.eventsStarted = false;
    this.runtime = null;
    this.lastConnectionState = "disconnected";
  }

  async invoke<T>(descriptor: NativeCallDescriptor, request?: unknown): Promise<T> {
    const operation = descriptor.operation;
    if (isBestEffortControlOperation(operation)) {
      return this.invokeBestEffortControl<T>(operation, request);
    }
    let runtimeInvokeSettled: Promise<void> = Promise.resolve();
    const run = async (): Promise<T> => {
      try {
        const runtime = await this.ensureRuntime();
        if (operation === "sdk.create") {
          return { handle: 1 } as T;
        }
        if (operation === "event.subscribe") {
          await this.ensureEventPipeline();
          return { id: 1 } as T;
        }
        if (operation === "event.unsubscribe" || operation === "event.unsubscribe_all") {
          return undefined as T;
        }
        if (operation === "sdk.dispose" || operation === "sdk.hard_reset") {
          this.eventsStarted = false;
          await runtime.dispose?.();
          this.lastConnectionState = "disconnected";
          return undefined as T;
        }
        if (operation === "sdk.login") {
          this.lastConnectionState = "connecting";
        }

        const runtimeInvoke = this.invokeRuntimeOperation<T>(operation, request);
        runtimeInvokeSettled = runtimeInvoke.then(
          () => undefined,
          () => undefined,
        );
        return await this.withInvokeTimeout(operation, runtimeInvoke);
      } catch (error) {
        this.captureInvokeFailureState(operation, error);
        if (error instanceof FlareSdkException && error.code === "wasm.invoke_timeout") {
          this.lastConnectionState = operation === "sdk.login" || operation === "sdk.init"
            ? "disconnected"
            : "reconnecting";
          if (operation === "sdk.login" || operation === "sdk.init") {
            this.eventsStarted = false;
            this.runtime = null;
          }
        }
        if (operation === "sdk.login") {
          this.lastConnectionState = "disconnected";
        }
        if (error instanceof FlareSdkException) {
          throw error;
        }
        throw new FlareSdkException(
          "wasm.invoke_failed",
          error instanceof Error ? error.message : `${error}`,
          operation,
          { transport: "wasm-production" },
        );
      }
    };

    const next = this.invokeChain.then(run, run);
    const awaitSettled = () => this.awaitRuntimeSettledBounded(operation, runtimeInvokeSettled);
    this.invokeChain = next.then(awaitSettled, awaitSettled).then(
      () => undefined,
      () => undefined,
    );
    return next;
  }
}
