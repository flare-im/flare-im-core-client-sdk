package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** One operation in an observable view delta. */
data class ViewDeltaOp(
    /** wire: `op`. Delta operation: insert, update, remove, or move. */
    val op: String = "",
    /** wire: `key`. Stable item key owned by core. */
    val key: String = "",
    /** wire: `index`. Target index after applying the operation. */
    val index: Int = 0,
    /** wire: `fromIndex`. Previous index for move operations. */
    val fromIndex: Int? = null,
    /** wire: `item`. Inserted or updated item payload. */
    val item: Map<String, Any?>? = null,
)
