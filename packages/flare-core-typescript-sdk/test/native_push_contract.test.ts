import { expect, it, vi } from "vitest";
import { DefaultFlareImClient } from "../src/adapter/defaultFlareImClient";
import { NativeCallMap, type NativeBridge } from "../src/contract/bridge_contract";

it("forwards OS lifecycle as canonical push operations without a second registration policy", async () => {
  const status = { state: "pending", configuredProviders: 1, registeredProviders: 0, pendingRevocations: 1, lastError: null };
  const invoke = vi.fn(async () => status);
  const client = new DefaultFlareImClient({ invoke } as NativeBridge);
  const input = { provider: "fcm", platform: "android", token: "os-fixture" };
  await expect(client.updatePushToken(input)).resolves.toEqual(status);
  expect(invoke).toHaveBeenLastCalledWith(NativeCallMap.sdkUpdatePushToken, input);
  await client.setPushPermission({ allowed: false });
  expect(invoke).toHaveBeenLastCalledWith(NativeCallMap.sdkSetPushPermission, { allowed: false });
  await client.clearPushToken({ provider: "fcm" });
  expect(invoke).toHaveBeenLastCalledWith(NativeCallMap.sdkClearPushToken, { provider: "fcm" });
  await expect(client.reconcilePush()).resolves.toEqual(status);
  await expect(client.pushStatus()).resolves.toEqual(status);
});
