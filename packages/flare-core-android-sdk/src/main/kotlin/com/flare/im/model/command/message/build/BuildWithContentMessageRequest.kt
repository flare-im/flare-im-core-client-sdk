package com.flare.im.model.command.message.build

import com.flare.im.model.entity.MessageContent

/** GENERATED. Do not edit by hand. */
/** Build from an existing MessageContent envelope. */
data class BuildWithContentMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `content`. Decoded content envelope. */
    val content: MessageContent,
)
