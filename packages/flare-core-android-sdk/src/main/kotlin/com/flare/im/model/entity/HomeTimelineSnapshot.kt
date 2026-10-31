package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** HomeTimelineSnapshot */
data class HomeTimelineSnapshot(
    /** wire: `conversations`.  */
    val conversations: List<Conversation> = emptyList(),
    /** wire: `syncState`.  */
    val syncState: TimelineSyncState,
    /** wire: `totalUnread`. Unread total across all conversations, not only the returned ones (the rule of `conversation.total_unread`). */
    val totalUnread: Long = 0L,
)
