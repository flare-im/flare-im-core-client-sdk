package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** HomeTimelineSnapshot */
data class HomeTimelineSnapshot(
    /** wire: `conversations`.  */
    val conversations: List<Conversation> = emptyList(),
    /** wire: `syncState`.  */
    val syncState: TimelineSyncState,
    /** wire: `totalUnread`.  */
    val totalUnread: Long = 0L,
)
