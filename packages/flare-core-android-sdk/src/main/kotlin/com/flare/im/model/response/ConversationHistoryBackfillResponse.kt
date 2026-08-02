package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Result of direct local-store historical backfill for one conversation. */
data class ConversationHistoryBackfillResponse(
    /** wire: `conversationId`. Stable conversation id. */
    val conversationId: String = "",
    /** wire: `pagesLoaded`. Number of older pages that advanced the local oldest seq. */
    val pagesLoaded: Int = 0,
    /** wire: `oldestSeqBefore`. Oldest local conversation seq before backfill. */
    val oldestSeqBefore: Long = 0L,
    /** wire: `oldestSeqAfter`. Oldest local conversation seq after backfill. */
    val oldestSeqAfter: Long = 0L,
    /** wire: `hasMore`. Whether the server reported more history remains. */
    val hasMore: Boolean = false,
    /** wire: `completed`. True when this call reached the earliest visible history or the server reported no more pages. */
    val completed: Boolean = false,
)
