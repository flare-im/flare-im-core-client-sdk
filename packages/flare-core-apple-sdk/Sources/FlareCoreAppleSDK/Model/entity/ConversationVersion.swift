import Foundation

/// GENERATED. Do not edit by hand.
/// Version stamp used by sync summary reconciliation.
public struct ConversationVersion: Codable, Sendable {
    /// wire: `conversationId`. 
    public let conversationId: String
    /// wire: `version`. 
    public let version: UInt64

    public init(conversationId: String = "", version: UInt64 = 0) {
        self.conversationId = conversationId
        self.version = version
    }
}
