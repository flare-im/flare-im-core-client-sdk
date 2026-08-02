import Foundation

/// GENERATED. Do not edit by hand.
/// Build from an existing MessageContent envelope.
public struct BuildWithContentMessageRequest: Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `content`. Decoded content envelope.
    public let content: MessageContent

    public init(conversationId: String = "", content: MessageContent) {
        self.conversationId = conversationId
        self.content = content
    }
}
