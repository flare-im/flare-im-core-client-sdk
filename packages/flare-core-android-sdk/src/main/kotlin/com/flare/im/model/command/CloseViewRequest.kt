package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Request for closing an observable view. */
data class CloseViewRequest(
    /** wire: `viewId`. View id returned from an open view call. */
    val viewId: String = "",
)
