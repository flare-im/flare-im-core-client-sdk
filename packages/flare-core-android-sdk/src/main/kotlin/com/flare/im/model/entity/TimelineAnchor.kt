package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** The message a timeline view opens around (a search result, a quote, a pinned message). */
data class TimelineAnchor(
    /** wire: `messageId`. Server id or client id of the target. Its local seq is used when the message is stored locally. */
    val messageId: String? = null,
    /** wire: `seq`. Conversation seq of the target, used when the message is not stored locally. With neither the open fails with sdk.view.anchor_not_found. */
    val seq: Long? = null,
)
