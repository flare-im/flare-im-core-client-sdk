import { afterEach, describe, expect, it, vi } from "vitest";
import { h, nextTick, reactive, watch } from "vue";
import { flushPromises } from "@vue/test-utils";
import { FlarePluginDetailSheet, FlarePluginView } from "@flare-im/vue-ui";
import { CorePluginMessage } from "../src/index";
import { cardContent, deferred, fakePort, mountWithSession, unmountAll } from "./support";

const envelope = { pluginId: "acme.poll", contributionId: "acme.poll.card", schemaVersion: 1, summary: "Lunch?", payload: { pollId: "p1" } };
const content = cardContent(envelope);
const choices = {
  kind: "choices", multiple: false, voted: false, closed: false, showResults: false, inputName: "selection",
  options: [{ index: 0, label: "Noodles", selected: false }, { index: 1, label: "Rice", selected: false }],
  action: { id: "vote", label: "Vote" },
};
const card = (extra: Record<string, unknown> = {}) => ({
  available: true, title: "Lunch?", fields: [], actions: [{ id: "note", label: "Add a note", form: ["text"] }],
  blocks: [choices], inputs: [{ id: "text", kind: "text", label: "Note", required: true }], stateVersion: 1, ...extra,
});

afterEach(unmountAll);

function renderCard(port = fakePort({ presentMessage: vi.fn(async () => card()) }), props: Record<string, unknown> = {}, directory?: Parameters<typeof mountWithSession>[2]) {
  const state = reactive({ messageExtra: { pluginStateVersion: "1" } as Record<string, unknown> });
  const { wrapper } = mountWithSession(port, () => h(CorePluginMessage, { content, messageId: "srv-1", messageExtra: state.messageExtra, ...props }), directory);
  const view = () => wrapper.getComponent(FlarePluginView);
  return { port, wrapper, view, state };
}

describe("CorePluginMessage", () => {
  it("draws Core's v2 view for the stored message", async () => {
    const { port, view } = renderCard();
    await flushPromises();
    expect(port.presentMessage).toHaveBeenCalledWith(expect.objectContaining({ message: envelope, messageId: "srv-1", platform: "web", kind: "message-content" }));
    expect(view().props("view")).toMatchObject({ available: true, title: "Lunch?", blocks: [choices] });
    expect(view().props("busyActionId")).toBeUndefined();
  });

  it("submits a choice with its selection and holds busyActionId on that action until Core answers", async () => {
    const answer = deferred<unknown>();
    const port = fakePort({ presentMessage: vi.fn(async () => card()), invokeAction: vi.fn(() => answer.promise) });
    const { view } = renderCard(port);
    await flushPromises();
    view().vm.$emit("action", "vote", { selection: [1] });
    await nextTick();
    expect(port.invokeAction).toHaveBeenCalledWith(expect.objectContaining({
      message: envelope, actionId: "vote", messageId: "srv-1", conversationId: "conv-1", userGesture: true, selection: [1],
    }));
    expect(port.invokeAction.mock.calls[0][0]).not.toHaveProperty("formValues");
    expect(view().props("busyActionId")).toBe("vote");
    // A second key while one is in flight starts nothing.
    view().vm.$emit("action", "note", { formValues: { text: "x" } });
    expect(port.invokeAction).toHaveBeenCalledTimes(1);
    answer.resolve({ kind: "operation", response: { success: true, data: { messageState: { mySelection: [1] } } } });
    await flushPromises();
    expect(view().props("busyActionId")).toBeUndefined();
    expect(view().props("error")).toBeUndefined();
    // The stored state is shown without waiting for the change event.
    expect(port.presentMessage).toHaveBeenCalledTimes(2);
  });

  it("hands Core's form errors back to the card's form and clears them, and the error, on the next call", async () => {
    const port = fakePort({ presentMessage: vi.fn(async () => card()) });
    port.invokeAction
      .mockResolvedValueOnce({ kind: "formErrors", errors: [{ input: "text", issue: "tooLong" }, { input: "x", issue: "bogus" }] })
      .mockResolvedValueOnce({ kind: "operation", response: { success: false } })
      .mockImplementationOnce(() => new Promise(() => {}));
    const { view } = renderCard(port);
    await flushPromises();
    view().vm.$emit("action", "note", { formValues: { text: "a".repeat(300) } });
    await flushPromises();
    expect(port.invokeAction).toHaveBeenLastCalledWith(expect.objectContaining({ actionId: "note", formValues: { text: "a".repeat(300) } }));
    expect(view().props("formErrors")).toEqual([{ input: "text", issue: "tooLong" }]);
    expect(view().props("busyActionId")).toBeUndefined();
    expect(port.presentMessage).toHaveBeenCalledTimes(1);

    view().vm.$emit("action", "note", { formValues: { text: "ok" } });
    await flushPromises();
    expect(view().props("formErrors")).toEqual([]);
    expect(view().props("error")).toBeTruthy();

    view().vm.$emit("action", "vote", { selection: [0] });
    await nextTick();
    expect(view().props("error")).toBeUndefined();
    expect(view().props("formErrors")).toEqual([]);
    expect(view().props("busyActionId")).toBe("vote");
  });

  it("says a failed call and settles busyActionId", async () => {
    const port = fakePort({ presentMessage: vi.fn(async () => card()), invokeAction: vi.fn(async () => { throw new Error("offline"); }) });
    const { view } = renderCard(port);
    await flushPromises();
    view().vm.$emit("action", "vote", { selection: [0] });
    await flushPromises();
    expect(view().props("error")).toBeTruthy();
    expect(view().props("busyActionId")).toBeUndefined();
    expect(view().props("settleToken")).toBe(1);
  });

  it("moves settleToken once per finished action, with that action's outcome already set", async () => {
    const answers = [deferred<unknown>(), deferred<unknown>(), deferred<unknown>()];
    let call = 0;
    const port = fakePort({ presentMessage: vi.fn(async () => card()), invokeAction: vi.fn(() => answers[call++].promise) });
    const { view } = renderCard(port);
    await flushPromises();
    // What the kit sees each time the token moves: the token, the error and the form errors of that moment.
    const seen: unknown[] = [];
    const stop = watch(() => view().props("settleToken"), (token) => {
      seen.push([token, view().props("error"), view().props("formErrors")]);
    });
    expect(view().props("settleToken")).toBe(0);
    view().vm.$emit("action", "vote", { selection: [1] });
    await nextTick();
    expect(view().props("settleToken")).toBe(0);
    answers[0].resolve({ kind: "operation", response: { success: false } });
    await flushPromises();
    view().vm.$emit("action", "note", { formValues: { text: "" } });
    await nextTick();
    answers[1].resolve({ kind: "formErrors", errors: [{ input: "text", issue: "required" }] });
    await flushPromises();
    view().vm.$emit("action", "vote", { selection: [0] });
    await nextTick();
    answers[2].resolve({ kind: "operation", response: { success: true, data: {} } });
    await flushPromises();
    stop();
    expect(seen).toEqual([
      [1, expect.any(String), []],
      [2, undefined, [{ input: "text", issue: "required" }]],
      [3, undefined, []],
    ]);
  });

  it("presents again when either state layer moves, and keeps an unchanged view as it is", async () => {
    const port = fakePort({ presentMessage: vi.fn(async () => card()) });
    const { view, state } = renderCard(port);
    await flushPromises();
    const first = view().props("view");
    state.messageExtra = { ...state.messageExtra, pluginSharedStateVersion: "7" };
    await flushPromises();
    expect(port.presentMessage).toHaveBeenCalledTimes(2);
    expect(view().props("view")).toBe(first);
    port.presentMessage.mockResolvedValue(card({ sharedStateVersion: 8, blocks: [{ ...choices, voted: true, showResults: true }] }));
    state.messageExtra = { ...state.messageExtra, pluginSharedStateVersion: "8" };
    await flushPromises();
    expect(port.presentMessage).toHaveBeenCalledTimes(3);
    expect(view().props("view")).toMatchObject({ sharedStateVersion: 8, blocks: [{ voted: true }] });
    state.messageExtra = { ...state.messageExtra, pluginStateVersion: "2" };
    await flushPromises();
    expect(port.presentMessage).toHaveBeenCalledTimes(4);
    // Other attributes changing is not new card state.
    state.messageExtra = { ...state.messageExtra, unrelated: "x" };
    await flushPromises();
    expect(port.presentMessage).toHaveBeenCalledTimes(4);
  });

  it("opens 'see all' in the kit detail sheet: loading, the detail view, an error with retry", async () => {
    const answer = deferred<unknown>();
    const port = fakePort({ presentMessage: vi.fn(async () => card({ detail: true })), pluginDetail: vi.fn(() => answer.promise) });
    const { view, wrapper } = renderCard(port);
    await flushPromises();
    expect(wrapper.findComponent(FlarePluginDetailSheet).exists()).toBe(false);
    view().vm.$emit("openDetail");
    await nextTick();
    const sheet = () => wrapper.getComponent(FlarePluginDetailSheet);
    expect(sheet().props()).toMatchObject({ open: true, loading: true, title: "Lunch?" });
    expect(port.pluginDetail).toHaveBeenCalledWith(expect.objectContaining({ message: envelope, messageId: "srv-1", conversationId: "conv-1", userGesture: true, platform: "web" }));
    answer.reject(new Error("plugin down"));
    await flushPromises();
    expect(sheet().props("loading")).toBe(false);
    expect(sheet().props("error")).toBeTruthy();

    port.pluginDetail.mockResolvedValueOnce({ available: true, title: "All answers", fields: [], actions: [],
      blocks: [{ kind: "entries", items: [{ index: 1, text: "Noodles", userId: "u-1" }], numbered: true, total: 1, more: false }] });
    sheet().vm.$emit("retry");
    await flushPromises();
    expect(port.pluginDetail).toHaveBeenCalledTimes(2);
    expect(sheet().props("error")).toBeUndefined();
    expect(sheet().props("view")).toMatchObject({ title: "All answers", blocks: [{ kind: "entries" }] });

    // A state change while it is open reloads it quietly: Core refreshes the shown sheet.
    const shown = sheet().props("view");
    port.pluginDetail.mockResolvedValueOnce({ available: true, title: "All answers (2)", fields: [], actions: [] });
    view().vm.$emit("action", "vote", { selection: [0] });
    await flushPromises();
    expect(port.pluginDetail).toHaveBeenCalledTimes(3);
    const [refresh] = port.pluginDetail.mock.calls.at(-1)!;
    expect(refresh).toMatchObject({ messageId: "srv-1", conversationId: "conv-1", userGesture: true, refresh: true });
    expect(refresh.previous).toBe(shown);
    expect(refresh).not.toHaveProperty("cursor");
    expect(sheet().props("loading")).toBe(false);
    expect(sheet().props("view")).toMatchObject({ title: "All answers (2)" });

    sheet().vm.$emit("close");
    await nextTick();
    expect(sheet().props("open")).toBe(false);
  });

  it("keeps an action run from the detail in the sheet: its own spinner, failure, form errors, members and settle", async () => {
    const answer = deferred<unknown>();
    const members = [{ userId: "u-1", name: "Ann" }];
    const port = fakePort({
      presentMessage: vi.fn(async () => card({ detail: true })),
      pluginDetail: vi.fn(async () => ({ available: true, title: "All answers", fields: [], actions: [{ id: "note", label: "Add a note", form: ["text"] }] })),
      invokeAction: vi.fn(() => answer.promise),
    });
    const { view, wrapper } = renderCard(port, {}, { members: () => members });
    await flushPromises();
    view().vm.$emit("openDetail");
    await flushPromises();
    const sheet = () => wrapper.getComponent(FlarePluginDetailSheet);
    expect(sheet().props("members")).toBe(members);
    sheet().vm.$emit("action", "note", { formValues: { text: "" } });
    await nextTick();
    expect(sheet().props("busyActionId")).toBe("note");
    expect(view().props("busyActionId")).toBeUndefined();
    // One action per card at a time: the card's keys start nothing meanwhile.
    view().vm.$emit("action", "vote", { selection: [0] });
    expect(port.invokeAction).toHaveBeenCalledTimes(1);
    answer.resolve({ kind: "formErrors", errors: [{ input: "text", issue: "required" }] });
    await flushPromises();
    expect(sheet().props()).toMatchObject({ busyActionId: undefined, formErrors: [{ input: "text", issue: "required" }], settleToken: 1 });
    expect(view().props()).toMatchObject({ formErrors: [], settleToken: 0, error: undefined });

    port.invokeAction.mockRejectedValueOnce(new Error("offline"));
    sheet().vm.$emit("action", "note", { formValues: { text: "x" } });
    await flushPromises();
    expect(sheet().props("actionError")).toBeTruthy();
    expect(sheet().props("error")).toBeUndefined();
    expect(sheet().props("settleToken")).toBe(2);
    expect(view().props("error")).toBeUndefined();
  });

  it("loads the detail's next page with the same request, the cursor and the shown sheet, and shows Core's merged sheet", async () => {
    const first = { available: true, title: "Voters", fields: [], actions: [], nextCursor: "50",
      blocks: [{ kind: "entries", items: [{ index: 1, text: "Ann" }], numbered: true, total: 2, more: false }] };
    const merged = { available: true, title: "Voters", fields: [], actions: [],
      blocks: [{ kind: "entries", items: [{ index: 1, text: "Ann" }, { index: 2, text: "Bob" }], numbered: true, total: 2, more: false }] };
    const page = deferred<unknown>();
    const port = fakePort({ presentMessage: vi.fn(async () => card({ detail: true })), pluginDetail: vi.fn(async () => first) });
    const { view, wrapper, state } = renderCard(port);
    await flushPromises();
    view().vm.$emit("openDetail");
    await flushPromises();
    const sheet = () => wrapper.getComponent(FlarePluginDetailSheet);
    const shown = sheet().props("view");
    expect(shown).toMatchObject({ nextCursor: "50" });

    port.pluginDetail.mockImplementationOnce(() => page.promise);
    sheet().vm.$emit("loadMore", "50");
    await nextTick();
    expect(sheet().props("loadingMore")).toBe(true);
    const [request] = port.pluginDetail.mock.calls.at(-1)!;
    expect(request).toMatchObject({ message: envelope, messageId: "srv-1", conversationId: "conv-1", userGesture: true, cursor: "50" });
    expect(request.previous).toBe(shown);
    // A second tap while the page is on its way asks for nothing.
    sheet().vm.$emit("loadMore", "50");
    expect(port.pluginDetail).toHaveBeenCalledTimes(2);
    page.resolve(merged);
    await flushPromises();
    expect(sheet().props("loadingMore")).toBe(false);
    expect(sheet().props("view")).toMatchObject({ blocks: [{ items: [{ text: "Ann" }, { text: "Bob" }] }] });
    expect(sheet().props("view")).not.toHaveProperty("nextCursor");

    // New shared state while the sheet shows two pages: the refresh hands Core the merged sheet, whose
    // answer replaces it whole, both pages kept.
    const loaded = sheet().props("view");
    const refreshed = { ...merged, blocks: [{ ...merged.blocks[0], items: [{ index: 1, text: "Cy" }, { index: 2, text: "Ann" }] }], nextCursor: "100" };
    port.pluginDetail.mockResolvedValueOnce(refreshed);
    state.messageExtra = { ...state.messageExtra, pluginSharedStateVersion: "9" };
    await flushPromises();
    const [refresh] = port.pluginDetail.mock.calls.at(-1)!;
    expect(refresh).toMatchObject({ refresh: true });
    expect(refresh.previous).toBe(loaded);
    expect(sheet().props("loading")).toBe(false);
    expect(sheet().props("view")).toMatchObject({ nextCursor: "100", blocks: [{ items: [{ text: "Cy" }, { text: "Ann" }] }] });
  });

  it("keeps the loaded pages when the next one fails, and says so in the sheet", async () => {
    const first = { available: true, title: "Voters", fields: [], actions: [], nextCursor: "50" };
    const port = fakePort({ presentMessage: vi.fn(async () => card({ detail: true })), pluginDetail: vi.fn(async () => first) });
    const { view, wrapper } = renderCard(port);
    await flushPromises();
    view().vm.$emit("openDetail");
    await flushPromises();
    const sheet = () => wrapper.getComponent(FlarePluginDetailSheet);
    port.pluginDetail.mockRejectedValueOnce(new Error("plugin down"));
    sheet().vm.$emit("loadMore", "50");
    await flushPromises();
    expect(sheet().props()).toMatchObject({ loadingMore: false, error: undefined, view: { title: "Voters", nextCursor: "50" } });
    expect(sheet().props("actionError")).toBeTruthy();
    expect(view().props("error")).toBeUndefined();
    // The retry starts clean.
    port.pluginDetail.mockResolvedValueOnce({ ...first, nextCursor: undefined });
    sheet().vm.$emit("loadMore", "50");
    await nextTick();
    expect(sheet().props("actionError")).toBeUndefined();
    await flushPromises();
    expect(sheet().props("view")).not.toHaveProperty("nextCursor");
  });

  it("does not open a detail the contribution does not declare", async () => {
    const { view, wrapper, port } = renderCard();
    await flushPromises();
    view().vm.$emit("openDetail");
    await nextTick();
    expect(wrapper.findComponent(FlarePluginDetailSheet).exists()).toBe(false);
    expect(port.pluginDetail).not.toHaveBeenCalled();
  });

  it("passes the host's resolveUser and conversation members to the card, props over the provided directory", async () => {
    const resolveUser = vi.fn(() => ({ name: "Ann" }));
    const members = [{ userId: "u-1", name: "Ann" }];
    const provided = renderCard(undefined, {}, { resolveUser, members: () => members });
    await flushPromises();
    expect(provided.view().props("resolveUser")).toBe(resolveUser);
    expect(provided.view().props("members")).toBe(members);

    const own = vi.fn(() => ({ name: "Bob" }));
    const mine = [{ userId: "u-2", name: "Bob" }];
    const overridden = renderCard(undefined, { resolveUser: own, members: mine }, { resolveUser, members: () => members });
    await flushPromises();
    expect(overridden.view().props("resolveUser")).toBe(own);
    expect(overridden.view().props("members")).toBe(mine);

    const bare = renderCard();
    await flushPromises();
    expect(bare.view().props("resolveUser")).toBeUndefined();
    expect(bare.view().props("members")).toEqual([]);
  });

  it("settles nothing for an action started before the card showed another message", async () => {
    const answer = deferred<unknown>();
    const port = fakePort({ presentMessage: vi.fn(async () => card()), invokeAction: vi.fn(() => answer.promise) });
    const state = reactive({ messageId: "srv-1" });
    const { wrapper } = mountWithSession(port, () => h(CorePluginMessage, { content, messageId: state.messageId }));
    await flushPromises();
    const view = () => wrapper.getComponent(FlarePluginView);
    view().vm.$emit("action", "vote", { selection: [0] });
    await nextTick();
    state.messageId = "srv-2";
    await flushPromises();
    expect(view().props("busyActionId")).toBeUndefined();
    answer.resolve({ kind: "operation", response: { success: false } });
    await flushPromises();
    expect(view().props("error")).toBeUndefined();
  });
});
