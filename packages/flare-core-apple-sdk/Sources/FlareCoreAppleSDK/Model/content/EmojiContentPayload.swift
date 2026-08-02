import Foundation

/// GENERATED. Do not edit by hand.
/// Emoji message payload.
public struct EmojiContentPayload: Codable, Sendable {
    /// wire: `emoji`. Emoji key or unicode.
    public let emoji: String

    public init(emoji: String = "") {
        self.emoji = emoji
    }
}
