package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Aggregated typing/input-state notification for large conversations. */
data class TypingAggregateEvent(
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `typingUserIds`. Users currently typing in the aggregation window. */
    val typingUserIds: List<String> = emptyList(),
    /** wire: `typingCount`. Number of users currently typing in the aggregation window. */
    val typingCount: Int = 0,
)
