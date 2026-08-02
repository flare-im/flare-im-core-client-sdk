package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** ConversationTimelineSnapshot */
data class ConversationTimelineSnapshot(
    /** wire: `conversation`.  */
    val conversation: Conversation? = null,
    /** wire: `hasMore`.  */
    val hasMore: Boolean = false,
    /** wire: `messages`.  */
    val messages: List<Message> = emptyList(),
)
