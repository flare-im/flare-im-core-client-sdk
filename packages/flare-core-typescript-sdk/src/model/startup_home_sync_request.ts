/** GENERATED. Do not edit by hand. */

/** Core-owned startup sync policy shared by all platform SDKs. */
export interface StartupHomeSyncRequest {
  /** wire: `backfillVisibleHistories`.  */
  backfillVisibleHistories: boolean;
  /** wire: `conversationLimit`.  */
  conversationLimit: number;
  /** wire: `historyBackfillLimit`.  */
  historyBackfillLimit: number;
  /** wire: `historyBackfillMaxConversations`.  */
  historyBackfillMaxConversations: number;
  /** wire: `historyBackfillMaxPagesPerConversation`.  */
  historyBackfillMaxPagesPerConversation: number;
  /** wire: `startBackgroundConvergence`.  */
  startBackgroundConvergence: boolean;
}
