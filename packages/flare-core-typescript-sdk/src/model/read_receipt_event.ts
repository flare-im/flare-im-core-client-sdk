/** GENERATED. Do not edit by hand. */

/** Read receipt notification. */
export interface ReadReceiptEvent {
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `userId`. Reader user id. */
  userId: string;
  /** wire: `readSeq`. Read sequence. */
  readSeq: number;
}
