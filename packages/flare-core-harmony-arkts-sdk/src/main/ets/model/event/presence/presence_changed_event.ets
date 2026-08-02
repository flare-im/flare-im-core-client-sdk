// GENERATED. Do not edit by hand.

/** Presence notification payload. */
export interface PresenceChangedEvent {
  /** wire: `conversationId`. Conversation id when presence is scoped to a conversation. */
  conversationId?: string;
  /** wire: `userId`. User id. */
  userId: string;
  /** wire: `status`. Presence status. */
  status: string;
  /** wire: `extra`. Opaque presence details. */
  extra: Record<string, string>;
}
