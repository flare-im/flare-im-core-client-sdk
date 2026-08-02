package com.flare.im.model.query

/** GENERATED. Do not edit by hand. */
/** Page messages before a sequence in a conversation. */
data class ListMessagesRequest(
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `beforeSeq`. Fetch messages before this sequence; 0 means latest page. */
    val beforeSeq: Long = 0L,
    /** wire: `limit`. Page size. */
    val limit: Int = 0,
)
