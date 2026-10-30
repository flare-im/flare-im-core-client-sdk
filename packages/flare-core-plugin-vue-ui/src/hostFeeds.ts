import { ref, watch, type Ref } from "vue";
import { resolveMessageId, type MessageLike } from "@flare-im/vue-ui";
import type { CorePluginStateChange, CorePluginStateFeed } from "./context";
import type { PluginPostedCard } from "./composerMenu";

/** The SDK event channel that says a card's stored state moved (`onMessagePluginStateChanged`). */
export const CORE_PLUGIN_STATE_CHANNEL = "im://message_plugin_state_changed";

export interface CorePluginStateHub {
  /** What cards subscribe to: `provideCorePluginUi({ stateChanges })` and the plugins' own providers. */
  stateChanges: CorePluginStateFeed;
  /**
   * Forwards one `im://message_plugin_state_changed` payload (`{conversationId?, messageId}`) to the cards. One
   * without a message id names no card and is dropped; returns whether a card was named.
   */
  announce(payload: unknown): boolean;
}

/**
 * The host's side of card state changes: the host routes the SDK event into `announce`, the cards listening on
 * `stateChanges` present again when theirs is named. One per app; nothing is polled and nothing else is read again.
 */
export function createCorePluginStateFeed(): CorePluginStateHub {
  const listeners = new Set<(change: CorePluginStateChange) => void>();
  return {
    stateChanges: (listener) => {
      listeners.add(listener);
      return () => { listeners.delete(listener); };
    },
    announce(payload) {
      const record = (payload ?? {}) as { messageId?: unknown; conversationId?: unknown };
      if (typeof record.messageId !== "string" || !record.messageId) return false;
      const change: CorePluginStateChange = {
        messageId: record.messageId,
        ...(typeof record.conversationId === "string" && record.conversationId ? { conversationId: record.conversationId } : {}),
      };
      for (const listener of [...listeners]) listener(change);
      return true;
    },
  };
}

/**
 * The cards Core posts for the user (a "+" create: a red packet, a poll, a task) arrive in the timeline like any message
 * pushed to the conversation; the create result's `posted` only says where and under which id. Hand `posted` the
 * result's card: once a row with that server id is in `messages`, `show` brings the timeline to it (by the kit's id
 * for the row). One card at a time, the newest create wins; a card posted elsewhere, or awaited when the conversation
 * changes, is let go.
 */
export function usePluginPostedCards(messages: () => readonly MessageLike[], conversationId: () => string,
  show: (messageId: string) => void): { posted(card: PluginPostedCard): void; awaited: Readonly<Ref<string | null>> } {
  const awaited = ref<string | null>(null);
  watch([messages, awaited], ([list, serverMsgId]) => {
    if (!serverMsgId) return;
    const row = list.find((message) => message.serverId === serverMsgId);
    if (!row) return;
    awaited.value = null;
    show(resolveMessageId(row));
  });
  watch(conversationId, () => { awaited.value = null; });
  return {
    posted(card) {
      if (card.conversationId === conversationId()) awaited.value = card.serverMsgId;
    },
    awaited,
  };
}
