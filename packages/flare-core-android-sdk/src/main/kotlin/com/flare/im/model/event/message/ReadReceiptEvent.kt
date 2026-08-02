package com.flare.im.model.event.message

/** GENERATED. Do not edit by hand. */
/** Read receipt notification. */
data class ReadReceiptEvent(
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `userId`. Reader user id. */
    val userId: String = "",
    /** wire: `readSeq`. Read sequence. */
    val readSeq: Long = 0L,
)
