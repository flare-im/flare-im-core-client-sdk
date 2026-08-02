package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Tagged snapshot emitted by core observable views. */
data class ViewSnapshot(
    /** wire: `viewType`. Snapshot tag: timeline or conversationList. */
    val viewType: String = "",
    /** wire: `data`. Snapshot payload selected by viewType. */
    val data: Map<String, Any?> = emptyMap(),
)
