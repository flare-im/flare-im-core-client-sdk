package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build an emoji message. */
data class BuildEmojiMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `emoji`. Emoji key. */
    val emoji: String = "",
)
