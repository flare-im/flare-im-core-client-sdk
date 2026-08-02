// GENERATED. Do not edit by hand.

/** Page messages before a sequence in a conversation. */
export interface ListMessagesRequest {
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `beforeSeq`. Fetch messages before this sequence; 0 means latest page. */
  beforeSeq: number;
  /** wire: `limit`. Page size. */
  limit: number;
}
