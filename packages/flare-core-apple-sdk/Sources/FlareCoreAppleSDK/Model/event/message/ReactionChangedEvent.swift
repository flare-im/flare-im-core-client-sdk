import Foundation

/// GENERATED. Do not edit by hand.
/// Message reaction changed notification.
public struct ReactionChangedEvent: Codable, Sendable {
    /// wire: `conversationId`. Conversation id.
    public let conversationId: String
    /// wire: `serverMsgId`. Server message id.
    public let serverMsgId: String
    /// wire: `userId`. User who changed the reaction.
    public let userId: String
    /// wire: `emoji`. Reaction emoji.
    public let emoji: String
    /// wire: `action`. Reaction action integer from core.
    public let action: Int32

    public init(conversationId: String = "", serverMsgId: String = "", userId: String = "", emoji: String = "", action: Int32 = 0) {
        self.conversationId = conversationId
        self.serverMsgId = serverMsgId
        self.userId = userId
        self.emoji = emoji
        self.action = action
    }
}
