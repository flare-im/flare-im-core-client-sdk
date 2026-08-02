import Foundation

/// GENERATED. Do not edit by hand.
/// Page messages before a sequence in a conversation.
public struct ListMessagesRequest: Codable, Sendable {
    /// wire: `conversationId`. Conversation id.
    public let conversationId: String
    /// wire: `beforeSeq`. Fetch messages before this sequence; 0 means latest page.
    public let beforeSeq: UInt64
    /// wire: `limit`. Page size.
    public let limit: UInt32

    public init(conversationId: String = "", beforeSeq: UInt64 = 0, limit: UInt32 = 0) {
        self.conversationId = conversationId
        self.beforeSeq = beforeSeq
        self.limit = limit
    }
}
