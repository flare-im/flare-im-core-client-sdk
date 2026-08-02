import { describe, expect, it, vi } from "vitest";

import { HeartbeatAppState } from "../model/heartbeat_app_state";
import { installWebHeartbeatLifecycle } from "./heartbeatLifecycle";

describe("installWebHeartbeatLifecycle", () => {
  it("wires document visibility into adaptive heartbeat app state", async () => {
    const listeners = new Map<string, Set<() => void>>();
    let visibilityState: DocumentVisibilityState = "visible";
    const documentLike = {
      get visibilityState() {
        return visibilityState;
      },
      addEventListener: vi.fn((name: string, listener: () => void) => {
        const bucket = listeners.get(name) ?? new Set();
        bucket.add(listener);
        listeners.set(name, bucket);
      }),
      removeEventListener: vi.fn((name: string, listener: () => void) => {
        listeners.get(name)?.delete(listener);
      }),
    };
    const setHeartbeatAppState = vi.fn(async () => undefined);

    const binding = installWebHeartbeatLifecycle(
      { setHeartbeatAppState },
      { document: documentLike },
    );

    expect(setHeartbeatAppState).toHaveBeenLastCalledWith({
      appState: HeartbeatAppState.Foreground,
    });

    visibilityState = "hidden";
    for (const listener of listeners.get("visibilitychange") ?? []) {
      listener();
    }
    await Promise.resolve();

    expect(setHeartbeatAppState).toHaveBeenLastCalledWith({
      appState: HeartbeatAppState.Background,
    });

    binding.dispose();
    visibilityState = "visible";
    for (const listener of listeners.get("visibilitychange") ?? []) {
      listener();
    }
    await Promise.resolve();

    expect(setHeartbeatAppState).toHaveBeenCalledTimes(2);
    expect(documentLike.removeEventListener).toHaveBeenCalledOnce();
  });
});
