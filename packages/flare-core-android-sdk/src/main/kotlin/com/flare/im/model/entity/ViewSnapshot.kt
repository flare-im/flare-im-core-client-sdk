package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Tagged snapshot emitted by core observable views. */
data class ViewSnapshot(
    /** wire: `viewType`. Snapshot tag: timeline or conversationList. */
    val viewType: String = "",
    /** wire: `data`. Snapshot payload selected by viewType: TimelineViewSnapshot for timeline, HomeTimelineSnapshot for conversationList. */
    val data: Map<String, Any?> = emptyMap(),
)
