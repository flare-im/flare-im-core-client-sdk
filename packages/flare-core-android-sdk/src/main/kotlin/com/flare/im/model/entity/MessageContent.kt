package com.flare.im.model.entity

import com.flare.im.model.common.enums.MessageContentType

/** GENERATED. Do not edit by hand. */
/** Decoded content envelope. Type-specific payload lives in `data` until per-content models are generated. */
data class MessageContent(
    /** wire: `contentType`. Content discriminator. */
    val contentType: MessageContentType,
    /** wire: `data`. Content payload object. */
    val data: Map<String, Any?> = emptyMap(),
)
