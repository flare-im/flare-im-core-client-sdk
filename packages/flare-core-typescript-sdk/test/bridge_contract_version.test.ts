import { describe, expect, it, vi } from "vitest";

import { FfiNativeBridge } from "../src/bridge/ffiNativeBridge";
import { FlareSdkException } from "../src/bridge/flareSdkException";
import { WasmNativeBridge } from "../src/bridge/wasmNativeBridge";
import { NativeCallMap } from "../src/contract/bridge_contract";
import { ffiContractVersion } from "../src/contract/sdk_contract";

describe("binding contract version guard", () => {
  it("checks the wasm runtime contract version before invoking operations", async () => {
    const invoke = vi.fn(async () => ({ ok: true }));
    const bridge = new WasmNativeBridge({
      runtime: {
        invoke,
        flareBindingContractVersion: () => ffiContractVersion,
      },
    });

    await expect(bridge.invoke(NativeCallMap.sdkSessionActive)).resolves.toEqual({ ok: true });
    expect(invoke).toHaveBeenCalledWith("sdk.session_active", "{}");
  });

  it("rejects stale wasm runtimes before calling into core", async () => {
    const invoke = vi.fn(async () => ({ ok: true }));
    const bridge = new WasmNativeBridge({
      runtime: {
        invoke,
        flareBindingContractVersion: () => "flare-im-ffi/old",
      },
    });

    await expect(bridge.invoke(NativeCallMap.sdkSessionActive)).rejects.toMatchObject({
      code: "contract.version_mismatch",
      operation: "diagnostics.ffi_contract_version",
    });
    expect(invoke).not.toHaveBeenCalled();
  });

  it("checks the C-FFI host contract version once before invoking operations", async () => {
    const invoke = vi.fn(async (operation: string) => {
      if (operation === "diagnostics.ffi_contract_version") {
        return JSON.stringify({ version: ffiContractVersion });
      }
      return JSON.stringify({ ready: true });
    });
    const bridge = new FfiNativeBridge({ invoke });

    await expect(bridge.invoke(NativeCallMap.sdkSessionActive)).resolves.toEqual({ ready: true });
    await expect(bridge.invoke(NativeCallMap.sdkIsConnected)).resolves.toEqual({ ready: true });

    expect(invoke.mock.calls.map(([operation]) => operation)).toEqual([
      "diagnostics.ffi_contract_version",
      "sdk.session_active",
      "sdk.is_connected",
    ]);
  });

  it("rejects native hosts that do not expose a contract version", async () => {
    const bridge = new FfiNativeBridge({
      invoke: vi.fn(async () => "null"),
    });

    await expect(bridge.invoke(NativeCallMap.sdkSessionActive)).rejects.toBeInstanceOf(
      FlareSdkException,
    );
    await expect(bridge.invoke(NativeCallMap.sdkSessionActive)).rejects.toMatchObject({
      code: "contract.version_unavailable",
      operation: "diagnostics.ffi_contract_version",
    });
  });
});
