package com.flare.im.model.content

/** GENERATED. Do not edit by hand. */
/** Forward message payload. */
data class ForwardContentPayload(
    /** wire: `merge`. Merge forwarded messages into one card. */
    val merge: Boolean? = null,
    /** wire: `title`. Forward title. */
    val title: String? = null,
    /** wire: `sourceMessages`. Forwarded sources. */
    val sourceMessages: List<ForwardSourceMessage> = emptyList(),
)
