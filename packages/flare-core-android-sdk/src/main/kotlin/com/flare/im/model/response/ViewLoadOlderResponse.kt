package com.flare.im.model.response

import com.flare.im.model.entity.ViewUpdate

/** GENERATED. Do not edit by hand. */
/** Response returned after extending an observable timeline view. */
data class ViewLoadOlderResponse(
    /** wire: `viewId`. Updated timeline view id. */
    val viewId: String = "",
    /** wire: `loadedCount`. Number of older messages inserted into the view window. */
    val loadedCount: Int = 0,
    /** wire: `hasMore`. Whether older messages may still be available. */
    val hasMore: Boolean = false,
    /** wire: `update`. Delta or snapshot that applies this page to the view. */
    val update: ViewUpdate? = null,
)
