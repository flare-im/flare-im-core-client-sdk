package com.flare.im.model.command.message

import com.flare.im.model.entity.Message

/** GENERATED. Do not edit by hand. */
/** Send a fully built message. */
data class SendMessageRequest(
    /** wire: `message`. Message to send. */
    val message: Message,
    /** wire: `expectedUserId`. Optional active-user precondition; cannot override the authenticated sender. */
    val expectedUserId: String? = null,
)
