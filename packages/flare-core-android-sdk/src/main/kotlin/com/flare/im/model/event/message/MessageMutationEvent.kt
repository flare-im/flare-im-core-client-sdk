package com.flare.im.model.event.message

/** GENERATED. Do not edit by hand. */
/** Message mutation notification for recall, edit, delete, pin, mark and burn events. */
data class MessageMutationEvent(
    /** wire: `name`. Mutation event name. */
    val name: MessageEventName,
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `messageId`. Client or server message id. */
    val messageId: String? = null,
    /** wire: `serverMsgId`. Server message id. */
    val serverMsgId: String? = null,
    /** wire: `userId`. User associated with the mutation. */
    val userId: String? = null,
    /** wire: `reason`. Mutation reason when available. */
    val reason: String? = null,
)
