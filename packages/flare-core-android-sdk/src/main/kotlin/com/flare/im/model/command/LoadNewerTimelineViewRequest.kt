package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Request for extending a timeline view that is not attached to the latest with newer messages. */
data class LoadNewerTimelineViewRequest(
    /** wire: `viewId`. Timeline view id returned from openTimeline. */
    val viewId: String = "",
    /** wire: `messageLimit`. Maximum newer messages to load in this page. */
    val messageLimit: Int = 0,
)
