package com.flare.im.model.command.message

/** GENERATED. Do not edit by hand. */
/** Create a text message draft for a conversation. */
data class CreateTextMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `text`. Text body. */
    val text: String = "",
)
