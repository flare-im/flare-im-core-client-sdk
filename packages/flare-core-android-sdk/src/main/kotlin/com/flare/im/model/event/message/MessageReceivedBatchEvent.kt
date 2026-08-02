package com.flare.im.model.event.message

import com.flare.im.model.entity.Message

/** GENERATED. Do not edit by hand. */
/** Batch message received notification. */
data class MessageReceivedBatchEvent(
    /** wire: `messages`. Received messages. */
    val messages: List<Message> = emptyList(),
)
