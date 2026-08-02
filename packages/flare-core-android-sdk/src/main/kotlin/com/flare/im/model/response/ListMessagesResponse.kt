package com.flare.im.model.response

import com.flare.im.model.entity.Message

/** GENERATED. Do not edit by hand. */
/** Message page response. */
data class ListMessagesResponse(
    /** wire: `messages`. Returned messages. */
    val messages: List<Message> = emptyList(),
)
