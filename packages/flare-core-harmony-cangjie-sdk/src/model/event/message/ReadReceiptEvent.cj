package flare_core_harmony_cangjie_sdk.model.event.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Read receipt notification.
public class ReadReceiptEvent {
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `userId`. Reader user id.
    public let userId: String
    // wire: `readSeq`. Read sequence.
    public let readSeq: UInt64

    public init(conversationId!: String, userId!: String, readSeq!: UInt64) {
        this.conversationId = conversationId
        this.userId = userId
        this.readSeq = readSeq
    }
}
