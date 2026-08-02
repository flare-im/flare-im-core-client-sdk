package com.flare.im.model.event.presence

/** GENERATED. Do not edit by hand. */
/** Presence notification payload. */
data class PresenceChangedEvent(
    /** wire: `conversationId`. Conversation id when presence is scoped to a conversation. */
    val conversationId: String? = null,
    /** wire: `userId`. User id. */
    val userId: String = "",
    /** wire: `status`. Presence status. */
    val status: String = "",
    /** wire: `extra`. Opaque presence details. */
    val extra: Map<String, String> = emptyMap(),
)
