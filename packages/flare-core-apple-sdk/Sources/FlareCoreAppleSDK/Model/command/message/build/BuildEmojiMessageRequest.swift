import Foundation

/// GENERATED. Do not edit by hand.
/// Build an emoji message.
public struct BuildEmojiMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `emoji`. Emoji key.
    public let emoji: String

    public init(conversationId: String = "", emoji: String = "") {
        self.conversationId = conversationId
        self.emoji = emoji
    }
}
