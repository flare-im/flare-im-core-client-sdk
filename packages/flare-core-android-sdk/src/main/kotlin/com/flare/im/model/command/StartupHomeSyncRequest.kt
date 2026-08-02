package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Core-owned startup sync policy shared by all platform SDKs. */
data class StartupHomeSyncRequest(
    /** wire: `backfillVisibleHistories`.  */
    val backfillVisibleHistories: Boolean = false,
    /** wire: `conversationLimit`.  */
    val conversationLimit: Int = 0,
    /** wire: `historyBackfillLimit`.  */
    val historyBackfillLimit: Int = 0,
    /** wire: `historyBackfillMaxConversations`.  */
    val historyBackfillMaxConversations: Int = 0,
    /** wire: `historyBackfillMaxPagesPerConversation`.  */
    val historyBackfillMaxPagesPerConversation: Int = 0,
    /** wire: `startBackgroundConvergence`.  */
    val startBackgroundConvergence: Boolean = false,
)
