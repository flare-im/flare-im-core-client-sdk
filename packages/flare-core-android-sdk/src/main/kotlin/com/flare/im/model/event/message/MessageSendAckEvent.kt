package com.flare.im.model.event.message

import com.flare.im.model.response.SendMessageResponse

/** GENERATED. Do not edit by hand. */
/** Message send acknowledgement notification. */
data class MessageSendAckEvent(
    /** wire: `ack`. Send acknowledgement. */
    val ack: SendMessageResponse,
)
