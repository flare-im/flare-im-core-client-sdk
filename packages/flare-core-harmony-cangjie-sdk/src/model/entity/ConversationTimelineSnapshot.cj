package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// ConversationTimelineSnapshot
public class ConversationTimelineSnapshot {
    // wire: `conversation`. Optional. 
    public let conversation: ?Conversation
    // wire: `hasMore`. 
    public let hasMore: Bool
    // wire: `messages`. 
    public let messages: String

    public init(conversation!: ?Conversation, hasMore!: Bool, messages!: String) {
        this.conversation = conversation
        this.hasMore = hasMore
        this.messages = messages
    }
}
