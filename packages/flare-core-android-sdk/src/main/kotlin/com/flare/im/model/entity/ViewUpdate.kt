package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Observable view update event payload (view.updated). Every update a view publishes carries the next revision; a host that sees a revision that is not its applied revision plus 1 drops it when it is not newer, otherwise replaces its window with timelineSnapshot. */
data class ViewUpdate(
    /** wire: `viewId`. Updated view id. */
    val viewId: String = "",
    /** wire: `revision`. Revision this update brings the view to. */
    val revision: Long = 0L,
    /** wire: `kind`. Update kind: snapshot or delta. */
    val kind: String = "",
    /** wire: `snapshot`. Whole view when kind is snapshot. */
    val snapshot: ViewSnapshot? = null,
    /** wire: `delta`. View delta when kind is delta. */
    val delta: ViewDelta? = null,
)
