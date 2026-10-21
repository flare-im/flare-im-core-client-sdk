import { describe, expect, it } from "vitest";
import { PluginUiSession, type PluginUiPort } from "./index";
const message = { pluginId: "example.poll", contributionId: "example.poll.card", schemaVersion: 1, summary: "Poll", payload: { packetId: "one", injected: "unused" } };
function port(): PluginUiPort { return { catalog: async () => ({}), resolveMessage: async () => ({ available: true, title: "Poll", fields: [], actions: [{ id: "vote", label: "Vote" }] }), action: async () => ({ target: { kind: "operation", operation: "example.poll.vote" }, payload: { packetId: "one" } }),
  presentMessage: async () => ({ available: true, title: "Poll", fields: [], actions: [], data: { packetId: "one", status: "completed" }, stateVersion: 3 }),
  invokeAction: async () => ({ kind: "operation", response: { success: true, data: { messageState: { version: 4, values: { status: "completed" } } } } }),
  dispatch: async () => ({ success: true }) }; }
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
  it("presents a stored card with the message id and keeps Core's merged data and state version", async () => {
    const api = port(); const requests: unknown[] = [];
    api.presentMessage = async (request) => { requests.push(request); return { available: true, title: "Poll", fields: [], actions: [], data: { packetId: "one", status: "completed" }, stateVersion: 3 }; };
    const host = new PluginUiSession(api, "web", () => "zh-CN");
    expect(await host.present(message, "client-1")).toEqual({ available: true, title: "Poll", fields: [], actions: [], data: { packetId: "one", status: "completed" }, stateVersion: 3 });
    expect(requests[0]).toEqual({ message, messageId: "client-1", platform: "web", locale: "zh-CN", kind: "message-content" });
    // Core would refuse these ids; the card still presents, without stored state.
    for (const bad of ["", "has space", "line\nbreak", "x".repeat(257)]) {
      await host.present(message, bad);
      expect(requests.at(-1)).not.toHaveProperty("messageId");
    }
    api.presentMessage = async () => ({ available: false, title: "Poll", fields: [], actions: [], data: { leaked: true }, stateVersion: 2 });
    expect(await host.present(message, "client-1")).toEqual({ available: false, title: "Poll", fields: [], actions: [], stateVersion: 2 });
    api.presentMessage = async () => { throw new Error("offline"); };
    expect(await host.present(message, "client-1")).toEqual({ available: false, title: "Poll", fields: [], actions: [], stateVersion: 0 });
  });
  it("invokes a card action through Core with the message and conversation", async () => {
    const api = port(); let request: unknown;
    api.invokeAction = async (value) => { request = value; return { kind: "operation", response: { success: true, data: { messageState: { version: 4, values: {} } } } }; };
    const host = new PluginUiSession(api, "tauri", () => "en-US");
    expect(await host.invokeAction(message, "vote", { messageId: "server-9", conversationId: "group-1", userGesture: true }))
      .toEqual({ kind: "operation", response: { success: true, data: { messageState: { version: 4, values: {} } } } });
    expect(request).toEqual({ message, messageId: "server-9", conversationId: "group-1", platform: "tauri", actionId: "vote", userGesture: true, nativeAllowlist: [] });
    api.invokeAction = async () => ({ kind: "host", target: { kind: "page", page: "wallet" }, payload: {} });
    await expect(host.invokeAction(message, "vote", { userGesture: true })).rejects.toThrow("Plugin target unavailable");
    const pages: string[] = [];
    const navigating = new PluginUiSession(api, "web", undefined, undefined, (page) => { pages.push(page); });
    await navigating.invokeAction(message, "vote", { userGesture: true });
    expect(pages).toEqual(["wallet"]);
  });
  it("drops an action result from a previous session", async () => {
    const api = port(); let release!: (value: unknown) => void;
    api.invokeAction = () => new Promise((resolve) => { release = resolve; });
    const host = new PluginUiSession(api, "web"); const pending = host.invokeAction(message, "vote", { userGesture: true }); host.reset();
    release({ kind: "operation", response: { success: true } });
    await expect(pending).rejects.toThrow("Plugin session changed");
  });
});
