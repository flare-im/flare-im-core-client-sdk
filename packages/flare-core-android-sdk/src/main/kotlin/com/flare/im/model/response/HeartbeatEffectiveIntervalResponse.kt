package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Currently effective heartbeat interval for diagnostics and platform observability. */
data class HeartbeatEffectiveIntervalResponse(
    /** wire: `connected`. Whether a live transport is available. */
    val connected: Boolean = false,
    /** wire: `intervalMs`. Effective heartbeat interval in milliseconds when connected. */
    val intervalMs: Long? = null,
    /** wire: `intervalSecs`. Effective heartbeat interval in seconds when connected. */
    val intervalSecs: Long? = null,
)
