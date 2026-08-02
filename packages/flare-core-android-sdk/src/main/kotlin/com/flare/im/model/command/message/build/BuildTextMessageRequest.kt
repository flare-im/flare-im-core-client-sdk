package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a text message. */
data class BuildTextMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `text`. Text body. */
    val text: String = "",
    /** wire: `mentionUsers`. User ids mentioned in the text body. The core builder resolves @userId spans into typed mentions. */
    val mentionUsers: List<String>? = null,
    /** wire: `mentionAll`. Whether the message mentions every member in the target conversation. */
    val mentionAll: Boolean? = null,
)
