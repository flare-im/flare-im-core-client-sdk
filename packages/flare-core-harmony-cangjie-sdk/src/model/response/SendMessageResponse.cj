package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Send acknowledgement returned by core-sdk.
public class SendMessageResponse {
    // wire: `ackId`. ACK id assigned by the transport layer, if present.
    public let ackId: String
    // wire: `serverId`. Server-assigned message id.
    public let serverId: String
    // wire: `clientMsgId`. Client message id acknowledged by the server.
    public let clientMsgId: String
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `seq`. Assigned conversation sequence.
    public let seq: UInt64
    // wire: `timestamp`. Server send time in milliseconds.
    public let timestamp: UInt64
    // wire: `success`. Whether this response contains a final accepted send ACK.
    public let success: Bool
    // wire: `errorCode`. Core ACK error code when success is false.
    public let errorCode: Int32
    // wire: `errorMessage`. Core ACK error message when success is false.
    public let errorMessage: String

    public init(ackId!: String, serverId!: String, clientMsgId!: String, conversationId!: String, seq!: UInt64, timestamp!: UInt64, success!: Bool, errorCode!: Int32, errorMessage!: String) {
        this.ackId = ackId
        this.serverId = serverId
        this.clientMsgId = clientMsgId
        this.conversationId = conversationId
        this.seq = seq
        this.timestamp = timestamp
        this.success = success
        this.errorCode = errorCode
        this.errorMessage = errorMessage
    }
}
