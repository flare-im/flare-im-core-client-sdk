import Foundation

/// GENERATED. Do not edit by hand.
/// Build a placeholder message.
public struct BuildPlaceholderMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `reason`. Placeholder reason.
    public let reason: String

    public init(conversationId: String = "", reason: String = "") {
        self.conversationId = conversationId
        self.reason = reason
    }
}
