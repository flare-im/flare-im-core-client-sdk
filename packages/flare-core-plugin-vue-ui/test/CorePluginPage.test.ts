/**
 * CorePluginPage: a plugin page over the core's `pluginPage` with its own stack. The first page, a next page with the
 * cursor and the shown page, a filter as the first page again, a refresh with the shown page; page actions through
 * the core's invoke with the page, its data and the row, never a message; a page target pushed with its own plugin and
 * the bound payload as arguments, popped by back, and `back` out of the root.
 */
import { afterEach, describe, expect, it, vi } from "vitest";
import { defineComponent, h, nextTick, shallowRef, type Component } from "vue";
import { flushPromises, mount } from "@vue/test-utils";
import { FlarePluginPage } from "@flare-im/vue-ui";
import { useFlareI18nProvider } from "@flare-im/vue-ui/i18n";
import type { PluginUiPort } from "@flare-im/sdk/plugin-ui";
import { CorePluginPage, corePluginPageEntry, type CorePluginPageEntry } from "../src/index";
import { fakePort } from "./support";

const root: CorePluginPageEntry = { pluginId: "flare.redpacket", page: "flare.redpacket.wallet", title: "Wallet" };
/** The wallet page as the core resolves it: its view, the data a page action binds over, and a next page. */
const page = (extra: Record<string, unknown> = {}) => ({
  available: true, title: "Wallet", fields: [{ label: "Balance", value: "¥12.30" }], actions: [{ id: "history", label: "History" }],
  data: { balanceText: "¥12.30" }, nextCursor: "c2", ...extra,
});

function pagePort(pluginPage: (request: Record<string, unknown>) => Promise<unknown>, invokeAction?: (request: Record<string, unknown>) => Promise<unknown>) {
  const port = fakePort(invokeAction ? { invokeAction } : {});
  return { ...port, pluginPage: vi.fn(pluginPage) };
}
type PagePort = ReturnType<typeof pagePort>;

const mounted: Array<{ unmount(): void }> = [];
afterEach(() => { mounted.splice(0).forEach((wrapper) => wrapper.unmount()); });

function render(port: PluginUiPort | null, props: Record<string, unknown> = {}) {
  const onBack = vi.fn();
  const portRef = shallowRef(port);
  const wrapper = mount(defineComponent({ setup() {
    useFlareI18nProvider("en-US");
    return () => h(CorePluginPage as Component, { root, port: portRef.value, platform: "web", loadFailedText: "The page didn't load", onBack, ...props });
  } }));
  mounted.push(wrapper);
  const host = () => wrapper.getComponent(FlarePluginPage);
  return { wrapper, host, onBack, portRef };
}
const calls = (port: PagePort) => port.pluginPage.mock.calls.map(([request]) => request);

describe("CorePluginPage", () => {
  it("opens the root page over pluginPage once a port is there", async () => {
    const port = pagePort(async () => page());
    const { host, portRef } = render(null);
    await flushPromises();
    expect(port.pluginPage).not.toHaveBeenCalled();
    portRef.value = port;
    await flushPromises();
    expect(calls(port)).toEqual([{ pluginId: "flare.redpacket", page: "flare.redpacket.wallet", platform: "web", locale: "en-US" }]);
    expect(host().props()).toMatchObject({ page: { pluginId: "flare.redpacket", page: "flare.redpacket.wallet" }, title: "Wallet", loading: false,
      back: true, view: { title: "Wallet", data: { balanceText: "¥12.30" }, nextCursor: "c2" } });
  });

  it("loads more with the cursor and the shown page, filters from the first page, refreshes with the shown page", async () => {
    const port = pagePort(async () => page());
    const { host } = render(port);
    await flushPromises();
    const shown = host().props("view");
    port.pluginPage.mockImplementationOnce(async () => page({ nextCursor: undefined }));
    host().vm.$emit("loadMore", "c2");
    await flushPromises();
    expect(calls(port)[1]).toMatchObject({ cursor: "c2", previous: shown });
    expect(host().props("view")).not.toHaveProperty("nextCursor");
    host().vm.$emit("filter", { kind: "claim" });
    await flushPromises();
    // A filter is the page's first page with the new values, not a refresh of the shown one.
    expect(calls(port)[2]).toMatchObject({ filters: { kind: "claim" } });
    expect(calls(port)[2]).not.toHaveProperty("refresh");
    expect(calls(port)[2]).not.toHaveProperty("cursor");
    expect(host().props("filters")).toEqual({ kind: "claim" });
    host().vm.$emit("refresh");
    await flushPromises();
    expect(calls(port)[3]).toMatchObject({ refresh: true, previous: expect.objectContaining({ title: "Wallet" }), filters: { kind: "claim" } });
    expect(calls(port)[3]).not.toHaveProperty("cursor");
    expect(calls(port)).toHaveLength(4);
  });

  it("keeps the shown page when a next page fails and says so where the page's actions say theirs", async () => {
    const port = pagePort(async () => page());
    const { host } = render(port, { errorText: (cause: unknown) => (String(cause).includes("disabled") ? "This plugin is disabled" : undefined) });
    await flushPromises();
    port.pluginPage.mockImplementationOnce(async () => { throw new Error("sdk.plugin.disabled"); });
    host().vm.$emit("loadMore", "c2");
    await flushPromises();
    expect(host().props()).toMatchObject({ view: { nextCursor: "c2" }, actionError: "This plugin is disabled", loadingMore: false, error: undefined });
  });

  it("runs a page action with the page, its data and the row, never a message, then reads the page again", async () => {
    const port = pagePort(async () => page(), async () => ({ kind: "operation", response: { success: true, data: {} } }));
    const { host } = render(port);
    await flushPromises();
    host().vm.$emit("action", "open", { page: { pluginId: root.pluginId, page: root.page }, data: { balanceText: "¥12.30" },
      row: { key: "l1", input: { packetId: "p1" } } });
    await flushPromises();
    const request = port.invokeAction.mock.calls[0][0];
    expect(request).toMatchObject({ page: { pluginId: root.pluginId, page: root.page }, actionId: "open", userGesture: true, platform: "web",
      data: { balanceText: "¥12.30" }, row: { key: "l1", input: { packetId: "p1" } } });
    expect(request).not.toHaveProperty("message");
    expect(request).not.toHaveProperty("messageId");
    expect(host().props()).toMatchObject({ busyActionId: undefined, settleToken: 1 });
    expect(calls(port)).toHaveLength(2);
    expect(calls(port)[1]).toMatchObject({ refresh: true });
  });

  it("says a refused action with the kit's line and a failed one with the host's copy", async () => {
    const port = pagePort(async () => page(), async () => ({ kind: "operation", response: { success: false } }));
    const { host } = render(port, { errorText: () => "Not permitted" });
    await flushPromises();
    host().vm.$emit("action", "open", { page: { pluginId: root.pluginId, page: root.page }, data: {} });
    await flushPromises();
    expect(host().props("actionError")).toBe("Plugin command rejected. Check permission and business state.");
    port.invokeAction.mockImplementationOnce(async () => { throw new Error("denied"); });
    host().vm.$emit("action", "open", { page: { pluginId: root.pluginId, page: root.page }, data: {} });
    await flushPromises();
    expect(host().props("actionError")).toBe("Not permitted");
    expect(calls(port)).toHaveLength(2);
  });

  it("reloads a journal completed by a refusal so its acknowledgement becomes available without reopening", async () => {
    let known = false;
    const port = pagePort(async () => page({ data: { journal: { known } },
      actions: [{ id: known ? "ack" : "retry", label: known ? "Acknowledge result" : "Retry original" }] }),
    async () => {
      known = true;
      return { kind: "operation", response: { success: false, data: { errorCode: "WALLET_REJECTED" } } };
    });
    const { host } = render(port);
    await flushPromises();
    expect(host().props("view")).toMatchObject({ data: { journal: { known: false } } });
    host().vm.$emit("action", "retry", { page: { pluginId: root.pluginId, page: root.page }, data: {} });
    await flushPromises();
    expect(host().props("view")).toMatchObject({ data: { journal: { known: true } }, actions: [{ id: "ack" }] });
    expect(host().props("actionError")).toBe("Plugin command rejected. Check permission and business state.");
    expect(calls(port).at(-1)).toMatchObject({ refresh: true });
  });

  it("pushes the page a target opens with its own plugin and the payload as arguments; back pops it, then leaves", async () => {
    const port = pagePort(async (request) => page({ title: request.page === "acme.task.board" ? "Board" : "Wallet" }),
      async () => ({ kind: "host", target: { kind: "page", page: "acme.task.board" }, payload: { boardId: "b1" } }));
    const { host, onBack } = render(port);
    await flushPromises();
    host().vm.$emit("action", "history", { page: { pluginId: root.pluginId, page: root.page }, data: {} });
    await flushPromises();
    // The target is the page of the plugin whose page ran the action.
    expect(calls(port).at(-1)).toMatchObject({ pluginId: "flare.redpacket", page: "acme.task.board", arguments: { boardId: "b1" } });
    expect(host().props()).toMatchObject({ page: { pluginId: "flare.redpacket", page: "acme.task.board" }, title: "Wallet" });
    host().vm.$emit("back");
    await flushPromises();
    expect(host().props("page")).toEqual({ pluginId: root.pluginId, page: root.page });
    expect(onBack).not.toHaveBeenCalled();
    host().vm.$emit("back");
    await nextTick();
    expect(onBack).toHaveBeenCalledTimes(1);
  });

  it("says why the page failed with the host's copy, or its generic line, and lets the kit draw an unavailable page", async () => {
    const port = pagePort(async () => { throw new Error("sdk.plugin.disabled"); });
    let view = render(port, { errorText: (cause: unknown) => (String(cause).includes("disabled") ? "This plugin is disabled" : undefined) });
    await flushPromises();
    expect(view.host().props("error")).toBe("This plugin is disabled");
    mounted.splice(0).forEach((wrapper) => wrapper.unmount());
    view = render(pagePort(async () => { throw new Error("offline"); }));
    await flushPromises();
    expect(view.host().props("error")).toBe("The page didn't load");
    view.host().vm.$emit("retry");
    mounted.splice(0).forEach((wrapper) => wrapper.unmount());
    view = render(pagePort(async () => ({ available: false, title: "", fields: [], actions: [], unavailableReason: "not_installed" })));
    await flushPromises();
    expect(view.host().props("view")).toMatchObject({ available: false, unavailableReason: "not_installed" });
  });

  it("gives a card's page target as an entry: its plugin, its page, the bound payload as arguments", () => {
    expect(corePluginPageEntry({ pluginId: "acme.task", page: "acme.task.board" }, { boardId: "b1" }, "Board"))
      .toEqual({ pluginId: "acme.task", page: "acme.task.board", title: "Board", args: { boardId: "b1" } });
    expect(corePluginPageEntry({ pluginId: "acme.task", page: "acme.task.board" })).toEqual({ pluginId: "acme.task", page: "acme.task.board", title: "" });
  });
});
