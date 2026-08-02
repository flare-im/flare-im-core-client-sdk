import Foundation

/// GENERATED. Do not edit by hand.
/// Read receipt notification.
public struct ReadReceiptEvent: Codable, Sendable {
    /// wire: `conversationId`. Conversation id.
    public let conversationId: String
    /// wire: `userId`. Reader user id.
    public let userId: String
    /// wire: `readSeq`. Read sequence.
    public let readSeq: UInt64

    public init(conversationId: String = "", userId: String = "", readSeq: UInt64 = 0) {
        self.conversationId = conversationId
        self.userId = userId
        self.readSeq = readSeq
    }
}
