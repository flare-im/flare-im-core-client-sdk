import { describe, expect, it } from "vitest";
import { PluginUiSession, type PluginUiPort } from "./index";
const message = { pluginId: "example.poll", contributionId: "example.poll.card", schemaVersion: 1, summary: "Poll", payload: { packetId: "one", injected: "unused" } };
function port(): PluginUiPort { return { catalog: async () => ({}), resolveMessage: async () => ({ available: true, title: "Poll", fields: [], actions: [{ id: "vote", label: "Vote" }] }), action: async () => ({ target: { kind: "operation", operation: "example.poll.vote" }, payload: { packetId: "one" } }), dispatch: async () => ({ success: true }) }; }
describe("plugin UI runtime adapter", () => {
  it("coalesces simultaneous timeline reads while actions still refresh", async () => {
    const api = port(); let calls = 0;
    api.catalog = async () => { calls++; await Promise.resolve(); return {}; };
    const host = new PluginUiSession(api, "web");
    await Promise.all(Array.from({ length: 100 }, () => host.resolve(message)));
    expect(calls).toBe(1);
    await host.invoke(message, "vote", true); expect(calls).toBe(2);
  });
  it("dispatches only the Rust-prepared input and refreshes before actions", async () => {
    const api = port(); let refreshed = 0, submitted: unknown;
    api.catalog = async () => { refreshed++; return {}; }; api.dispatch = async (input) => { submitted = input; return {}; };
    const host = new PluginUiSession(api, "web");
    await host.resolve(message); await host.invoke(message, "vote", true);
    expect(refreshed).toBe(2); expect(submitted).toEqual({ capabilityId: "example.poll.vote", payload: { packetId: "one" } });
  });
  it("discards completion from a previous session", async () => {
    const api = port(); let release!: (value: unknown) => void;
    api.catalog = () => new Promise((resolve) => { release = resolve; });
    const host = new PluginUiSession(api, "web"); const pending = host.resolve(message); host.reset(); release({});
    expect(await pending).toEqual({ available: false, title: "Poll", fields: [], actions: [] });
  });
  it("keeps unavailable history inert and rejects arbitrary byte payloads", async () => {
    const api = port(); api.catalog = async () => { throw new Error("offline"); };
    const host = new PluginUiSession(api, "tauri");
    expect((await host.resolve(message)).actions).toEqual([]);
    expect(host.envelope({ payload: [999], description: "bad" })).toBeNull();
    expect(host.envelope({ payload: [...new TextEncoder().encode(JSON.stringify(message))] })).toEqual(message);
  });
});
