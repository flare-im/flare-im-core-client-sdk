import Foundation

/// GENERATED. Do not edit by hand.
/// Build a structured card message.
public struct BuildCardMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `id`. Card target id.
    public let id: String
    /// wire: `cardType`. Card type key.
    public let cardType: String?
    /// wire: `title`. Display title.
    public let title: String?
    /// wire: `subtitle`. Display subtitle.
    public let subtitle: String?
    /// wire: `avatar`. Avatar URL or media id.
    public let avatar: String?

    public init(conversationId: String = "", id: String = "", cardType: String? = nil, title: String? = nil, subtitle: String? = nil, avatar: String? = nil) {
        self.conversationId = conversationId
        self.id = id
        self.cardType = cardType
        self.title = title
        self.subtitle = subtitle
        self.avatar = avatar
    }
}
