package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Request for opening an observable conversation timeline view. */
data class OpenTimelineViewRequest(
    /** wire: `conversationId`. Conversation id to observe. */
    val conversationId: String = "",
    /** wire: `messageLimit`. Maximum messages to include in the initial snapshot. */
    val messageLimit: Int = 0,
)
