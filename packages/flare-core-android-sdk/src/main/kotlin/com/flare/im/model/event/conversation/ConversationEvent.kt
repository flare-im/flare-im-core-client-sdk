package com.flare.im.model.event.conversation

/** GENERATED. Do not edit by hand. */
/** Conversation notification payload. */
data class ConversationEvent(
    /** wire: `name`. Conversation event name. */
    val name: ConversationEventName,
    /** wire: `conversationId`. Affected conversation id. */
    val conversationId: String? = null,
    /** wire: `conversationIds`. Affected conversation ids for sync events. */
    val conversationIds: List<String> = emptyList(),
    /** wire: `unreadCount`. Unread count for unread-count changes. */
    val unreadCount: Int? = null,
)
