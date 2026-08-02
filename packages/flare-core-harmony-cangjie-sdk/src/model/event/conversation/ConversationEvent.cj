package flare_core_harmony_cangjie_sdk.model.event.conversation

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Conversation notification payload.
public class ConversationEvent {
    // wire: `name`. Conversation event name.
    public let name: ConversationEventName
    // wire: `conversationId`. Optional. Affected conversation id.
    public let conversationId: ?String
    // wire: `conversationIds`. Affected conversation ids for sync events.
    public let conversationIds: String
    // wire: `unreadCount`. Optional. Unread count for unread-count changes.
    public let unreadCount: ?UInt32

    public init(name!: ConversationEventName, conversationId!: ?String, conversationIds!: String, unreadCount!: ?UInt32) {
        this.name = name
        this.conversationId = conversationId
        this.conversationIds = conversationIds
        this.unreadCount = unreadCount
    }
}
