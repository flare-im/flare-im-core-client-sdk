/** GENERATED. Do not edit by hand. */
import type { SetHeartbeatAppStateRequest } from "../model/set_heartbeat_app_state_request";
import { HeartbeatAppState } from "../model/heartbeat_app_state";

export interface HeartbeatAppStateClient {
  setHeartbeatAppState(request: SetHeartbeatAppStateRequest): Promise<void>;
}

export interface HeartbeatLifecycleBinding {
  sync(): Promise<void>;
  dispose(): void;
}

export interface HeartbeatLifecycleOptions {
  onError?: (error: unknown) => void;
}

export interface WebHeartbeatLifecycleOptions extends HeartbeatLifecycleOptions {
  document?: {
    readonly visibilityState?: DocumentVisibilityState | string;
    addEventListener(name: "visibilitychange", listener: () => void): void;
    removeEventListener(name: "visibilitychange", listener: () => void): void;
  };
  emitInitialState?: boolean;
}

export class HeartbeatLifecycleBridge {
  constructor(
    private readonly client: HeartbeatAppStateClient,
    private readonly options: HeartbeatLifecycleOptions = {},
  ) {}

  setForeground(): Promise<void> {
    return this.setAppState(HeartbeatAppState.Foreground);
  }

  setBackground(): Promise<void> {
    return this.setAppState(HeartbeatAppState.Background);
  }

  onResume(): Promise<void> {
    return this.setForeground();
  }

  onPause(): Promise<void> {
    return this.setBackground();
  }

  private async setAppState(appState: HeartbeatAppState): Promise<void> {
    try {
      await this.client.setHeartbeatAppState({ appState });
    } catch (error) {
      this.options.onError?.(error);
    }
  }
}

export function installWebHeartbeatLifecycle(
  client: HeartbeatAppStateClient,
  options: WebHeartbeatLifecycleOptions = {},
): HeartbeatLifecycleBinding {
  const documentRef = options.document ?? globalThis.document;
  const bridge = new HeartbeatLifecycleBridge(client, options);
  let disposed = false;

  const sync = () => {
    const hidden = documentRef?.visibilityState === "hidden";
    return hidden ? bridge.setBackground() : bridge.setForeground();
  };

  if (!documentRef) {
    return {
      sync,
      dispose: () => {
        disposed = true;
      },
    };
  }

  const listener = () => {
    if (!disposed) {
      void sync();
    }
  };
  documentRef.addEventListener("visibilitychange", listener);
  if (options.emitInitialState !== false) {
    void sync();
  }

  return {
    sync,
    dispose: () => {
      if (disposed) {
        return;
      }
      disposed = true;
      documentRef.removeEventListener("visibilitychange", listener);
    },
  };
}
