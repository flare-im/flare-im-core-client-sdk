package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a thread reply message. */
data class BuildThreadReplyMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `threadId`. Thread root message id. */
    val threadId: String = "",
    /** wire: `text`. Reply text. */
    val text: String = "",
)
