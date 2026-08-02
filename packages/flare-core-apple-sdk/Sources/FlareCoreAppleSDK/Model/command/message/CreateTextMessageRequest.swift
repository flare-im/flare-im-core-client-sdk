import Foundation

/// GENERATED. Do not edit by hand.
/// Create a text message draft for a conversation.
public struct CreateTextMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `text`. Text body.
    public let text: String

    public init(conversationId: String = "", text: String = "") {
        self.conversationId = conversationId
        self.text = text
    }
}
