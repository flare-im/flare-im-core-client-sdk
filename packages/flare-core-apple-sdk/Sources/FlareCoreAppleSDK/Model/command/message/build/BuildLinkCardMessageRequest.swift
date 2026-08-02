import Foundation

/// GENERATED. Do not edit by hand.
/// Build a link card message.
public struct BuildLinkCardMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `url`. Link URL.
    public let url: String
    /// wire: `title`. Card title.
    public let title: String?
    /// wire: `description`. Card description.
    public let description: String?
    /// wire: `thumbnailUrl`. Thumbnail URL.
    public let thumbnailUrl: String?
    /// wire: `siteName`. Site name.
    public let siteName: String?

    public init(conversationId: String = "", url: String = "", title: String? = nil, description: String? = nil, thumbnailUrl: String? = nil, siteName: String? = nil) {
        self.conversationId = conversationId
        self.url = url
        self.title = title
        self.description = description
        self.thumbnailUrl = thumbnailUrl
        self.siteName = siteName
    }
}
