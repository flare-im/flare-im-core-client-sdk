package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Aggregated typing/input-state notification for large conversations.
public class TypingAggregateEvent {
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `typingUserIds`. Users currently typing in the aggregation window.
    public let typingUserIds: String
    // wire: `typingCount`. Number of users currently typing in the aggregation window.
    public let typingCount: UInt32

    public init(conversationId!: String, typingUserIds!: String, typingCount!: UInt32) {
        this.conversationId = conversationId
        this.typingUserIds = typingUserIds
        this.typingCount = typingCount
    }
}
