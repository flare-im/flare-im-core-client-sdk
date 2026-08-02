import Foundation

/// GENERATED. Do not edit by hand.
/// Build a thread reply message.
public struct BuildThreadReplyMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `threadId`. Thread root message id.
    public let threadId: String
    /// wire: `text`. Reply text.
    public let text: String

    public init(conversationId: String = "", threadId: String = "", text: String = "") {
        self.conversationId = conversationId
        self.threadId = threadId
        self.text = text
    }
}
