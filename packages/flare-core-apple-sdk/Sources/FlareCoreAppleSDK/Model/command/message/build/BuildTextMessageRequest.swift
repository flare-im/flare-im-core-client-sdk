import Foundation

/// GENERATED. Do not edit by hand.
/// Build a text message.
public struct BuildTextMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `text`. Text body.
    public let text: String
    /// wire: `mentionUsers`. User ids mentioned in the text body. The core builder resolves @userId spans into typed mentions.
    public let mentionUsers: [String]?
    /// wire: `mentionAll`. Whether the message mentions every member in the target conversation.
    public let mentionAll: Bool?

    public init(conversationId: String = "", text: String = "", mentionUsers: [String]? = nil, mentionAll: Bool? = nil) {
        self.conversationId = conversationId
        self.text = text
        self.mentionUsers = mentionUsers
        self.mentionAll = mentionAll
    }
}
