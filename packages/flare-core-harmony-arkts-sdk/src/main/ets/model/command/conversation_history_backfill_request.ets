// GENERATED. Do not edit by hand.

/** Request to backfill one conversation's historical messages into the local store. */
export interface ConversationHistoryBackfillRequest {
  /** wire: `conversationId`. Stable conversation id. */
  conversationId: string;
  /** wire: `limit`. Maximum messages per backfill page. */
  limit?: number;
  /** wire: `maxPages`. Maximum historical pages to request for this call. */
  maxPages?: number;
}
