import Foundation

/// GENERATED. Do not edit by hand.
/// Message mutation notification for recall, edit, delete, pin, mark and burn events.
public struct MessageMutationEvent: Codable, Sendable {
    /// wire: `name`. Mutation event name.
    public let name: MessageEventName
    /// wire: `conversationId`. Conversation id.
    public let conversationId: String
    /// wire: `messageId`. Client or server message id.
    public let messageId: String?
    /// wire: `serverMsgId`. Server message id.
    public let serverMsgId: String?
    /// wire: `userId`. User associated with the mutation.
    public let userId: String?
    /// wire: `reason`. Mutation reason when available.
    public let reason: String?

    public init(name: MessageEventName, conversationId: String = "", messageId: String? = nil, serverMsgId: String? = nil, userId: String? = nil, reason: String? = nil) {
        self.name = name
        self.conversationId = conversationId
        self.messageId = messageId
        self.serverMsgId = serverMsgId
        self.userId = userId
        self.reason = reason
    }
}
