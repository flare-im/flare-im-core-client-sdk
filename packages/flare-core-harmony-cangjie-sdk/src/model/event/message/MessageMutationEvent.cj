package flare_core_harmony_cangjie_sdk.model.event.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Message mutation notification for recall, edit, delete, pin, mark and burn events.
public class MessageMutationEvent {
    // wire: `name`. Mutation event name.
    public let name: MessageEventName
    // wire: `conversationId`. Conversation id.
    public let conversationId: String
    // wire: `messageId`. Optional. Client or server message id.
    public let messageId: ?String
    // wire: `serverMsgId`. Optional. Server message id.
    public let serverMsgId: ?String
    // wire: `userId`. Optional. User associated with the mutation.
    public let userId: ?String
    // wire: `reason`. Optional. Mutation reason when available.
    public let reason: ?String

    public init(name!: MessageEventName, conversationId!: String, messageId!: ?String, serverMsgId!: ?String, userId!: ?String, reason!: ?String) {
        this.name = name
        this.conversationId = conversationId
        this.messageId = messageId
        this.serverMsgId = serverMsgId
        this.userId = userId
        this.reason = reason
    }
}
