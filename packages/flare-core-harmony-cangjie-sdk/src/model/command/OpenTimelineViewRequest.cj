package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request for opening an observable conversation timeline view.
public class OpenTimelineViewRequest {
    // wire: `conversationId`. Conversation id to observe.
    public let conversationId: String
    // wire: `messageLimit`. Maximum messages to include in the initial snapshot.
    public let messageLimit: UInt32

    public init(conversationId!: String, messageLimit!: UInt32) {
        this.conversationId = conversationId
        this.messageLimit = messageLimit
    }
}
