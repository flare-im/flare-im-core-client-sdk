package com.flare.im.model.event.message

import com.flare.im.model.entity.Message

/** GENERATED. Do not edit by hand. */
/** Single message received notification. */
data class MessageReceivedEvent(
    /** wire: `message`. Received message. */
    val message: Message,
)
