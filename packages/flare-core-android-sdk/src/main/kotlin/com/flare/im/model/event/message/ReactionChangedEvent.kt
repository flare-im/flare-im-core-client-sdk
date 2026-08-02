package com.flare.im.model.event.message

/** GENERATED. Do not edit by hand. */
/** Message reaction changed notification. */
data class ReactionChangedEvent(
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `serverMsgId`. Server message id. */
    val serverMsgId: String = "",
    /** wire: `userId`. User who changed the reaction. */
    val userId: String = "",
    /** wire: `emoji`. Reaction emoji. */
    val emoji: String = "",
    /** wire: `action`. Reaction action integer from core. */
    val action: Int = 0,
)
