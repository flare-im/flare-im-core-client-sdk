/** GENERATED. Do not edit by hand. */
import type { ConversationEventName } from './conversation_event_name';

/** Conversation notification payload. */
export interface ConversationEvent {
  /** wire: `name`. Conversation event name. */
  name: ConversationEventName;
  /** wire: `conversationId`. Affected conversation id. */
  conversationId?: string;
  /** wire: `conversationIds`. Affected conversation ids for sync events. */
  conversationIds: string[];
  /** wire: `unreadCount`. Unread count for unread-count changes. */
  unreadCount?: number;
}
