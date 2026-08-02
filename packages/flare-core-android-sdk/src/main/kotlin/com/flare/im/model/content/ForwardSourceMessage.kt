package com.flare.im.model.content

/** GENERATED. Do not edit by hand. */
/** One source message inside a forward bundle. */
data class ForwardSourceMessage(
    /** wire: `sourceMessageId`. Original message id. */
    val sourceMessageId: String = "",
    /** wire: `sourceConversationId`. Original conversation id. */
    val sourceConversationId: String? = null,
    /** wire: `sourceSenderId`. Original sender id. */
    val sourceSenderId: String? = null,
    /** wire: `plainText`. Preview text. */
    val plainText: String? = null,
)
