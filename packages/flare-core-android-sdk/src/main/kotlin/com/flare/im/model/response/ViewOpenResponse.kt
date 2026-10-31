package com.flare.im.model.response

import com.flare.im.model.entity.ViewSnapshot

/** GENERATED. Do not edit by hand. */
/** Response returned when opening an observable view and by timelineSnapshot. */
data class ViewOpenResponse(
    /** wire: `viewId`. View id. */
    val viewId: String = "",
    /** wire: `revision`. Revision of this snapshot; every later view.updated event for the view carries the next revision. */
    val revision: Long = 0L,
    /** wire: `snapshot`. Snapshot of the view at that revision. */
    val snapshot: ViewSnapshot,
)
