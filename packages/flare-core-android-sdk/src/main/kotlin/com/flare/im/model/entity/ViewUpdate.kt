package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Observable view update event payload. */
data class ViewUpdate(
    /** wire: `viewId`. Updated view id. */
    val viewId: String = "",
    /** wire: `kind`. Update kind: snapshot or delta. */
    val kind: String = "",
    /** wire: `snapshot`. Latest snapshot for this view when kind is snapshot. */
    val snapshot: ViewSnapshot? = null,
    /** wire: `delta`. View delta when kind is delta. */
    val delta: ViewDelta? = null,
)
