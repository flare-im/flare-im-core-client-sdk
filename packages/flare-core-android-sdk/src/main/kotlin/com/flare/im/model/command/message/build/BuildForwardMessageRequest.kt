package com.flare.im.model.command.message.build

import com.flare.im.model.content.ForwardSourceMessage

/** GENERATED. Do not edit by hand. */
/** Build a forward message. */
data class BuildForwardMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `merge`. Merge into one card. */
    val merge: Boolean? = null,
    /** wire: `title`. Forward title. */
    val title: String = "",
    /** wire: `sourceMessages`. Messages to forward. */
    val sourceMessages: List<ForwardSourceMessage> = emptyList(),
)
