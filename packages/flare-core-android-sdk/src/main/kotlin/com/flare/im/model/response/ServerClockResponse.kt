package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** The core's estimate of how far the server clock is from this device's. */
data class ServerClockResponse(
    /** wire: `offsetMs`. Server clock minus device clock, in milliseconds; 0 until estimated. */
    val offsetMs: Long = 0L,
    /** wire: `estimated`. Whether the offset rests on a server frame received this session. */
    val estimated: Boolean = false,
)
