package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Request to backfill one conversation's historical messages into the local store. */
data class ConversationHistoryBackfillRequest(
    /** wire: `conversationId`. Stable conversation id. */
    val conversationId: String = "",
    /** wire: `limit`. Maximum messages per backfill page. */
    val limit: Int? = null,
    /** wire: `maxPages`. Maximum historical pages to request for this call. */
    val maxPages: Int? = null,
)
