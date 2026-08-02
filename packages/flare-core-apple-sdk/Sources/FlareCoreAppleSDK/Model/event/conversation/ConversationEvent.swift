import Foundation

/// GENERATED. Do not edit by hand.
/// Conversation notification payload.
public struct ConversationEvent: Codable, Sendable {
    /// wire: `name`. Conversation event name.
    public let name: ConversationEventName
    /// wire: `conversationId`. Affected conversation id.
    public let conversationId: String?
    /// wire: `conversationIds`. Affected conversation ids for sync events.
    public let conversationIds: [String]
    /// wire: `unreadCount`. Unread count for unread-count changes.
    public let unreadCount: UInt32?

    public init(name: ConversationEventName, conversationId: String? = nil, conversationIds: [String] = [], unreadCount: UInt32? = nil) {
        self.name = name
        self.conversationId = conversationId
        self.conversationIds = conversationIds
        self.unreadCount = unreadCount
    }
}
