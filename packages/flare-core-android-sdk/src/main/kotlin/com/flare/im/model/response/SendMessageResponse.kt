package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Send acknowledgement returned by core-sdk. */
data class SendMessageResponse(
    /** wire: `ackId`. ACK id assigned by the transport layer, if present. */
    val ackId: String = "",
    /** wire: `serverId`. Server-assigned message id. */
    val serverId: String = "",
    /** wire: `clientMsgId`. Client message id acknowledged by the server. */
    val clientMsgId: String = "",
    /** wire: `conversationId`. Conversation id. */
    val conversationId: String = "",
    /** wire: `seq`. Assigned conversation sequence. */
    val seq: Long = 0L,
    /** wire: `timestamp`. Server send time in milliseconds. */
    val timestamp: Long = 0L,
    /** wire: `success`. Whether this response contains a final accepted send ACK. */
    val success: Boolean = false,
    /** wire: `errorCode`. Core ACK error code when success is false. */
    val errorCode: Int = 0,
    /** wire: `errorMessage`. Core ACK error message when success is false. */
    val errorMessage: String = "",
)
