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
    /// wire: `attributes`. Card attributes, the card elem's extra (CardContent.attributes), such as cardType and a shared person's referrerId. Blank keys are dropped.
    public let attributes: [String: String]?

    public init(conversationId: String = "", id: String = "", cardType: String? = nil, title: String? = nil, subtitle: String? = nil, avatar: String? = nil, attributes: [String: String]? = nil) {
        self.conversationId = conversationId
        self.id = id
        self.cardType = cardType
        self.title = title
        self.subtitle = subtitle
        self.avatar = avatar
        self.attributes = attributes
    }
}
