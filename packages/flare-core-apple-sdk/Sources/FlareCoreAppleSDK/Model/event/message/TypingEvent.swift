import Foundation

/// GENERATED. Do not edit by hand.
/// Typing/input-state notification.
public struct TypingEvent: Codable, Sendable {
    /// wire: `conversationId`. Conversation id.
    public let conversationId: String
    /// wire: `userId`. Typing user id.
    public let userId: String
    /// wire: `typing`. Whether user is typing.
    public let typing: Bool

    public init(conversationId: String = "", userId: String = "", typing: Bool = false) {
        self.conversationId = conversationId
        self.userId = userId
        self.typing = typing
    }
}
