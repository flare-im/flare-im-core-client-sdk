package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Result of handling a platform network-change notification. */
data class NetworkChangeResponse(
    /** wire: `reconnected`. Whether the SDK had an active session and attempted reconnect. */
    val reconnected: Boolean = false,
)
