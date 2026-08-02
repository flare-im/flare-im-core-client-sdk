// GENERATED. Do not edit by hand.

/** Typing/input-state notification. */
export interface TypingEvent {
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `userId`. Typing user id. */
  userId: string;
  /** wire: `typing`. Whether user is typing. */
  typing: boolean;
}
