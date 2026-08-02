package flare_core_harmony_cangjie_sdk.model.event.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Message reaction changed notification.
public class ReactionChangedEvent {
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `serverMsgId`. Server message id.
    public let serverMsgId: String
    // wire: `userId`. User who changed the reaction.
    public let userId: String
    // wire: `emoji`. Reaction emoji.
    public let emoji: String
    // wire: `action`. Reaction action integer from core.
    public let action: Int32

    public init(conversationId!: String, serverMsgId!: String, userId!: String, emoji!: String, action!: Int32) {
        this.conversationId = conversationId
        this.serverMsgId = serverMsgId
        this.userId = userId
        this.emoji = emoji
        this.action = action
    }
}
