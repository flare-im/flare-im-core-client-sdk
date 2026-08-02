package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Typed delta emitted by core observable views. */
data class ViewDelta(
    /** wire: `viewType`. Delta tag: timeline or conversationList. */
    val viewType: String = "",
    /** wire: `ops`. Ordered delta operations. */
    val ops: List<ViewDeltaOp> = emptyList(),
    /** wire: `conversation`. Latest timeline conversation header for timeline deltas. */
    val conversation: Conversation? = null,
    /** wire: `hasMore`. Latest timeline pagination state for timeline deltas. */
    val hasMore: Boolean? = null,
    /** wire: `totalUnread`. Latest total unread value for conversation list deltas. */
    val totalUnread: Long? = null,
    /** wire: `syncState`. Latest sync state for conversation list deltas. */
    val syncState: String? = null,
)
