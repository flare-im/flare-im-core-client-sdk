import Foundation

/// GENERATED. Do not edit by hand.
/// Conversation list response.
public struct ListConversationsResponse: Codable, Sendable {
    /// wire: `conversations`. Returned conversations.
    public let conversations: [Conversation]

    public init(conversations: [Conversation] = []) {
        self.conversations = conversations
    }
}
