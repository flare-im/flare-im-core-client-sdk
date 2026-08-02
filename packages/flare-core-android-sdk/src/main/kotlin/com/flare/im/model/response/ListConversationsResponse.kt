package com.flare.im.model.response

import com.flare.im.model.entity.Conversation

/** GENERATED. Do not edit by hand. */
/** Conversation list response. */
data class ListConversationsResponse(
    /** wire: `conversations`. Returned conversations. */
    val conversations: List<Conversation> = emptyList(),
)
