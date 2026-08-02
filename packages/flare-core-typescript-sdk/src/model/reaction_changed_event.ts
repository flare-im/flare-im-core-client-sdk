/** GENERATED. Do not edit by hand. */

/** Message reaction changed notification. */
export interface ReactionChangedEvent {
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `serverMsgId`. Server message id. */
  serverMsgId: string;
  /** wire: `userId`. User who changed the reaction. */
  userId: string;
  /** wire: `emoji`. Reaction emoji. */
  emoji: string;
  /** wire: `action`. Reaction action integer from core. */
  action: number;
}
