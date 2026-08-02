package com.flare.im.model.response

import com.flare.im.model.entity.ViewSnapshot

/** GENERATED. Do not edit by hand. */
/** Response returned when opening an observable view. */
data class ViewOpenResponse(
    /** wire: `viewId`. Opened view id. */
    val viewId: String = "",
    /** wire: `snapshot`. Initial snapshot for this view. */
    val snapshot: ViewSnapshot,
)
