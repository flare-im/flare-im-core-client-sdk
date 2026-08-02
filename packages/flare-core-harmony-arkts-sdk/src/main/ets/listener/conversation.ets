// GENERATED. Do not edit by hand.
import { ConversationEvent } from '../model';

/** Conversation listener callbacks. */
export interface ConversationEventListener {
  /** A new conversation was created or discovered. */
  onNewConversation?(event: ConversationEvent): void;
  /** Important conversation fields changed. */
  onConversationChanged?(event: ConversationEvent): void;
  /** The total unread message count changed. */
  onTotalUnreadMessageCountChanged?(event: ConversationEvent): void;
  /** A conversation was deleted. */
  onConversationDeleted?(event: ConversationEvent): void;
}
