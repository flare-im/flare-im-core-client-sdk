/**
 * The host's two feeds: card state changes the SDK announces go to the cards named, and a card Core posted is shown
 * once it reaches the timeline of the conversation it was posted to.
 */
import { describe, expect, it } from "vitest";
import { nextTick, ref } from "vue";
import type { MessageLike } from "@flare-im/vue-ui";
import { CORE_PLUGIN_STATE_CHANNEL, createCorePluginStateFeed, usePluginPostedCards, type CorePluginStateChange } from "../src/index";

describe("createCorePluginStateFeed", () => {
  it("names the announced card to every listener, drops a payload without a message id, and stops on unsubscribe", () => {
    const feed = createCorePluginStateFeed();
    const seen: CorePluginStateChange[] = [];
    const stop = feed.stateChanges((change) => seen.push(change));
    expect(feed.announce({ conversationId: "c1", messageId: "srv-1", version: 3 })).toBe(true);
    expect(feed.announce({ conversationId: "c1" })).toBe(false);
    expect(feed.announce(null)).toBe(false);
    expect(feed.announce({ messageId: "srv-2", conversationId: "" })).toBe(true);
    stop();
    feed.announce({ messageId: "srv-3" });
    expect(seen).toEqual([{ messageId: "srv-1", conversationId: "c1" }, { messageId: "srv-2" }]);
    expect(CORE_PLUGIN_STATE_CHANNEL).toBe("im://message_plugin_state_changed");
  });

  it("keeps two feeds apart", () => {
    const a = createCorePluginStateFeed(), b = createCorePluginStateFeed();
    const seen: string[] = [];
    a.stateChanges((change) => seen.push(`a:${change.messageId}`));
    b.stateChanges((change) => seen.push(`b:${change.messageId}`));
    b.announce({ messageId: "m1" });
    expect(seen).toEqual(["b:m1"]);
  });
});

/** A timeline row as far as the composable reads it. */
const row = (id: string, serverId?: string) => ({ id, ...(serverId ? { serverId } : {}) }) as unknown as MessageLike;

describe("usePluginPostedCards", () => {
  it("shows the posted card once it reaches the timeline, by the kit's id for its row", async () => {
    const rows = ref<MessageLike[]>([row("local-1", "srv-1")]);
    const conversation = ref("c1");
    const shown: string[] = [];
    const cards = usePluginPostedCards(() => rows.value, () => conversation.value, (id) => shown.push(id));
    cards.posted({ conversationId: "c1", serverMsgId: "srv-9", clientMsgId: "pcard-1" });
    await nextTick();
    expect(shown).toEqual([]);
    expect(cards.awaited.value).toBe("srv-9");
    rows.value = [...rows.value, row("srv-9", "srv-9")];
    await nextTick();
    expect(shown).toEqual(["srv-9"]);
    expect(cards.awaited.value).toBeNull();
    // Once shown, a later timeline read does not move the timeline again.
    rows.value = [...rows.value];
    await nextTick();
    expect(shown).toEqual(["srv-9"]);
  });

  it("lets a card go when it was posted elsewhere or the conversation changes before it arrives", async () => {
    const rows = ref<MessageLike[]>([]);
    const conversation = ref("c1");
    const shown: string[] = [];
    const cards = usePluginPostedCards(() => rows.value, () => conversation.value, (id) => shown.push(id));
    cards.posted({ conversationId: "c2", serverMsgId: "srv-1", clientMsgId: "" });
    expect(cards.awaited.value).toBeNull();
    cards.posted({ conversationId: "c1", serverMsgId: "srv-2", clientMsgId: "" });
    conversation.value = "c3";
    await nextTick();
    rows.value = [row("srv-2", "srv-2")];
    await nextTick();
    expect(shown).toEqual([]);
  });
});
