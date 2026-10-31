package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Response of loadOlderTimeline, loadNewerTimeline and jumpToLatestTimeline. The rows themselves arrive only through view.updated. */
data class TimelineViewPageResponse(
    /** wire: `viewId`. Timeline view id. */
    val viewId: String = "",
    /** wire: `loadedCount`. Rows this call added to the window. */
    val loadedCount: Int = 0,
    /** wire: `revision`. Revision that contains this page (0 when the view was already closed). */
    val revision: Long = 0L,
)
