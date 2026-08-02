package flare_core_harmony_cangjie_sdk.model.event.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Typing/input-state notification.
public class TypingEvent {
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `userId`. Typing user id.
    public let userId: String
    // wire: `typing`. Whether user is typing.
    public let typing: Bool

    public init(conversationId!: String, userId!: String, typing!: Bool) {
        this.conversationId = conversationId
        this.userId = userId
        this.typing = typing
    }
}
