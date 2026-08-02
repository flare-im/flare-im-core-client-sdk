package com.flare.im.model.event.message

import com.flare.im.model.common.error.SdkErrorPayload

/** GENERATED. Do not edit by hand. */
/** Message send failure notification. */
data class MessageSendFailedEvent(
    /** wire: `clientMsgId`. Client message id that failed. */
    val clientMsgId: String = "",
    /** wire: `reason`. Failure reason. */
    val reason: String = "",
    /** wire: `error`. Structured failure details when available. */
    val error: SdkErrorPayload? = null,
)
