package com.flare.im.model.event.message

/** GENERATED. Do not edit by hand. */
/** Typing/input-state notification. */
data class TypingEvent(
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `userId`. Typing user id. */
    val userId: String = "",
    /** wire: `typing`. Whether user is typing. */
    val typing: Boolean = false,
)
