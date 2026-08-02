import Foundation

/// GENERATED. Do not edit by hand.
/// Build a custom extension message.
public struct BuildCustomMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `type`. Extension type key.
    public let type: String

    public init(conversationId: String = "", type: String = "") {
        self.conversationId = conversationId
        self.type = type
    }
}
