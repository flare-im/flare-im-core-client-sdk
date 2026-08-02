package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Request for extending an open timeline view with older messages. */
data class LoadOlderTimelineViewRequest(
    /** wire: `viewId`. Timeline view id returned from openTimeline. */
    val viewId: String = "",
    /** wire: `messageLimit`. Maximum older messages to load in this page. */
    val messageLimit: Int = 0,
)
