import Foundation

/// GENERATED. Do not edit by hand.
/// Aggregated typing/input-state notification for large conversations.
public struct TypingAggregateEvent: Codable, Sendable {
    /// wire: `conversationId`. Conversation id.
    public let conversationId: String
    /// wire: `typingUserIds`. Users currently typing in the aggregation window.
    public let typingUserIds: [String]
    /// wire: `typingCount`. Number of users currently typing in the aggregation window.
    public let typingCount: UInt32

    public init(conversationId: String = "", typingUserIds: [String] = [], typingCount: UInt32 = 0) {
        self.conversationId = conversationId
        self.typingUserIds = typingUserIds
        self.typingCount = typingCount
    }
}
