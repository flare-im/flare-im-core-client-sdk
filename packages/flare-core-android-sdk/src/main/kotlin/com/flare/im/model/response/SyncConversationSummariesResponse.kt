package com.flare.im.model.response

import com.flare.im.model.entity.ConversationVersion

/** GENERATED. Do not edit by hand. */
/** Conversations whose local version is missing or newer than the caller's snapshot. */
data class SyncConversationSummariesResponse(
    /** wire: `changedConversations`.  */
    val changedConversations: List<ConversationVersion> = emptyList(),
)
