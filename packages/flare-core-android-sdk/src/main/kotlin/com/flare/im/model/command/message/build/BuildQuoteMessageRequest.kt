package com.flare.im.model.command.message.build

import com.flare.im.model.entity.MessageContent

/** GENERATED. Do not edit by hand. */
/** Build a quote/reply message. */
data class BuildQuoteMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `quotedMessageId`. Quoted message id. */
    val quotedMessageId: String = "",
    /** wire: `text`. Reply text. */
    val text: String = "",
    /** wire: `quotedSenderId`. Quoted sender id. */
    val quotedSenderId: String? = null,
    /** wire: `quotedTextPreview`. Quoted preview text. */
    val quotedTextPreview: String? = null,
    /** wire: `quotedContent`. Quoted message content element. */
    val quotedContent: MessageContent,
)
