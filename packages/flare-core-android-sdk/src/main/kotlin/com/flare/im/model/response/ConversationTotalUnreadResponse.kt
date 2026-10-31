package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Core-owned unread total for the conversations tab badge. */
data class ConversationTotalUnreadResponse(
    /** wire: `totalUnread`. Unread total across all conversations: archived ones count nothing, muted ones count only their mentions. */
    val totalUnread: Long = 0L,
)
