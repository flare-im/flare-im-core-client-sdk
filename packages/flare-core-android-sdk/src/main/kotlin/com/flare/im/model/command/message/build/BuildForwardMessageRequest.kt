package com.flare.im.model.command.message.build

import com.flare.im.model.entity.Message

/** GENERATED. Do not edit by hand. */
/** Build a forward message. */
data class BuildForwardMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `merge`. Merge into one card. */
    val merge: Boolean? = null,
    /** wire: `title`. Forward title. */
    val title: String = "",
    /** wire: `sourceMessages`. Messages to forward. Full messages, not id stubs: the forward payload embeds the original content, so the core needs content/senderId/conversationId of each source. */
    val sourceMessages: List<Message> = emptyList(),
)
