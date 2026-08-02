import fs from "node:fs";
import path from "node:path";

import { describe, expect, it, vi } from "vitest";

import { DefaultCapabilitiesApi } from "../src/adapter/module/DefaultCapabilitiesApi";
import type { NativeBridge } from "../src/contract/bridge_contract";
import { NativeCallMap } from "../src/contract/bridge_contract";

const requestGoldenDir = path.resolve(
  process.cwd(),
  "../../sdk-spec/golden/requests",
);
const responseGoldenDir = path.resolve(
  process.cwd(),
  "../../sdk-spec/golden/responses",
);

function readGolden(
  dir: string,
  name: string,
): Record<string, unknown> {
  return JSON.parse(
    fs.readFileSync(path.join(dir, name), "utf8"),
  ) as Record<string, unknown>;
}

describe("capability dispatch contract", () => {
  it("uses the capability-dispatch JSON bridge descriptor and preserves payload shape", async () => {
    const request = readGolden(requestGoldenDir, "capability_dispatch.json");
    const response = readGolden(
      responseGoldenDir,
      "capability_dispatch_unavailable.json",
    );
    const invoke = vi.fn(async () => response);
    const bridge: NativeBridge = { invoke };
    const api = new DefaultCapabilitiesApi(bridge);

    await expect(api.dispatchCapability(request)).resolves.toEqual(response);

    expect(NativeCallMap.capabilityDispatch).toMatchObject({
      operation: "capability.dispatch",
      transport: "capability-dispatch-json",
      cApi: "flare_capability_dispatch_json",
      dispatchOp: "capability_dispatch",
      responseEncoding: "json-object",
    });
    expect(invoke).toHaveBeenCalledWith(
      NativeCallMap.capabilityDispatch,
      request,
    );
  });
});
