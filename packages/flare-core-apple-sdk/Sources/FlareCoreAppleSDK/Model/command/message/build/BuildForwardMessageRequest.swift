import Foundation

/// GENERATED. Do not edit by hand.
/// Build a forward message.
public struct BuildForwardMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `merge`. Merge into one card.
    public let merge: Bool?
    /// wire: `title`. Forward title.
    public let title: String
    /// wire: `sourceMessages`. Messages to forward.
    public let sourceMessages: [ForwardSourceMessage]

    public init(conversationId: String = "", merge: Bool? = nil, title: String = "", sourceMessages: [ForwardSourceMessage] = []) {
        self.conversationId = conversationId
        self.merge = merge
        self.title = title
        self.sourceMessages = sourceMessages
    }
}
