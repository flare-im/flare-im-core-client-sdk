import Foundation

/// GENERATED. Do not edit by hand.
/// Build a forward message.
public struct BuildForwardMessageRequest: Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `merge`. Merge into one card.
    public let merge: Bool?
    /// wire: `title`. Forward title.
    public let title: String
    /// wire: `sourceMessages`. Messages to forward. Full messages, not id stubs: the forward payload embeds the original content, so the core needs content/senderId/conversationId of each source.
    public let sourceMessages: [Message]

    public init(conversationId: String = "", merge: Bool? = nil, title: String = "", sourceMessages: [Message] = []) {
        self.conversationId = conversationId
        self.merge = merge
        self.title = title
        self.sourceMessages = sourceMessages
    }
}
