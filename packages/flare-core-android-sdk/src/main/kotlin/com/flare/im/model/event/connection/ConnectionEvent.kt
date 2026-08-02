package com.flare.im.model.event.connection

import com.flare.im.model.common.enums.SdkConnectionState
import com.flare.im.model.common.error.SdkErrorPayload

/** GENERATED. Do not edit by hand. */
/** Connection notification payload. */
data class ConnectionEvent(
    /** wire: `name`. Connection event name. */
    val name: ConnectionEventName,
    /** wire: `state`. Connection state after this event. */
    val state: SdkConnectionState,
    /** wire: `reason`. Disconnect, kicked-off, or token-expired reason. */
    val reason: String? = null,
    /** wire: `attempt`. Reconnect attempt number. */
    val attempt: Int? = null,
    /** wire: `error`. Server or reconnect failure details. */
    val error: SdkErrorPayload? = null,
)
