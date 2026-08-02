package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// OpenConversationTimelineRequest
public class OpenConversationTimelineRequest {
    // wire: `conversationId`. 
    public let conversationId: String
    // wire: `messageLimit`. 
    public let messageLimit: UInt32

    public init(conversationId!: String, messageLimit!: UInt32) {
        this.conversationId = conversationId
        this.messageLimit = messageLimit
    }
}
