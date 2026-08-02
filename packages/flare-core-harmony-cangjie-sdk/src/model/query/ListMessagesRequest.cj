package flare_core_harmony_cangjie_sdk.model.query

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Page messages before a sequence in a conversation.
public class ListMessagesRequest {
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `beforeSeq`. Fetch messages before this sequence; 0 means latest page.
    public let beforeSeq: UInt64
    // wire: `limit`. Page size.
    public let limit: UInt32

    public init(conversationId!: String, beforeSeq!: UInt64, limit!: UInt32) {
        this.conversationId = conversationId
        this.beforeSeq = beforeSeq
        this.limit = limit
    }
}
