import Foundation

/// GENERATED. Do not edit by hand.
/// OpenConversationTimelineRequest
public struct OpenConversationTimelineRequest: Codable, Sendable {
    /// wire: `conversationId`. 
    public let conversationId: String
    /// wire: `messageLimit`. 
    public let messageLimit: UInt32

    public init(conversationId: String = "", messageLimit: UInt32 = 0) {
        self.conversationId = conversationId
        self.messageLimit = messageLimit
    }
}
