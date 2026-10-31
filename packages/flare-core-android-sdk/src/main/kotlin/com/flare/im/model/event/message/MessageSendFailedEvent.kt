package com.flare.im.model.event.message

import com.flare.im.model.common.error.SdkErrorPayload

/** GENERATED. Do not edit by hand. */
/** Message send failure notification. */
data class MessageSendFailedEvent(
    /** wire: `clientMsgId`. Client message id that failed. */
    val clientMsgId: String = "",
    /** wire: `reason`. Failure reason text for people; use error.code and error.machineReason to act on it. */
    val reason: String = "",
    /** wire: `error`. Structured failure: code, machineReason (ErrorDetail.reason when the server rejected), message, operation, retryable, details. */
    val error: SdkErrorPayload? = null,
)
