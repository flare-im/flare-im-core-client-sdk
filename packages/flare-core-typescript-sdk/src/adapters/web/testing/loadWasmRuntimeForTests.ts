import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

import type { FlareWasmRuntime } from "../../../bridge/wasmNativeBridge";

const WASM_DIR = path.resolve(
  fileURLToPath(new URL(".", import.meta.url)),
  "../../../../../../../flare-im-core-sdk/bindings/wasm/pkg",
);

export async function loadWasmRuntimeForTests(): Promise<FlareWasmRuntime> {
  const jsPath = path.join(WASM_DIR, "flare_im_core_sdk.js");
  const wasmPath = path.join(WASM_DIR, "flare_im_core_sdk_bg.wasm");
  if (!fs.existsSync(jsPath) || !fs.existsSync(wasmPath)) {
    throw new Error(`wasm pkg missing under ${WASM_DIR}; run wasm-pack build in bindings/wasm`);
  }

  const mod = (await import(/* @vite-ignore */ jsPath)) as {
    default: (input?: unknown) => Promise<unknown>;
    initSync?: (input: Uint8Array) => void;
    createWasmRuntime: () => Omit<FlareWasmRuntime, "flareBindingContractVersion">;
    flareBindingContractVersion: () => string;
  };

  const wasmBytes = fs.readFileSync(wasmPath);
  if (typeof mod.initSync === "function") {
    mod.initSync({ module: wasmBytes } as { module: Uint8Array });
  } else {
    await mod.default(wasmBytes);
  }
  const runtime = mod.createWasmRuntime();
  return {
    ...runtime,
    invoke: runtime.invoke.bind(runtime),
    ...(runtime.dispose ? { dispose: runtime.dispose.bind(runtime) } : {}),
    flareBindingContractVersion: mod.flareBindingContractVersion,
  };
}

export function wasmPkgDir(): string {
  return WASM_DIR;
}
