// GENERATED. Do not edit by hand.

/** Result of direct local-store historical backfill for one conversation. */
export interface ConversationHistoryBackfillResponse {
  /** wire: `conversationId`. Stable conversation id. */
  conversationId: string;
  /** wire: `pagesLoaded`. Number of older pages that advanced the local oldest seq. */
  pagesLoaded: number;
  /** wire: `oldestSeqBefore`. Oldest local conversation seq before backfill. */
  oldestSeqBefore: number;
  /** wire: `oldestSeqAfter`. Oldest local conversation seq after backfill. */
  oldestSeqAfter: number;
  /** wire: `hasMore`. Whether the server reported more history remains. */
  hasMore: boolean;
  /** wire: `completed`. True when this call reached the earliest visible history or the server reported no more pages. */
  completed: boolean;
}
