import Foundation

/// GENERATED. Do not edit by hand.
/// Build a mini program message.
public struct BuildMiniProgramMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `appId`. Mini program app id.
    public let appId: String
    /// wire: `pagePath`. Entry path.
    public let pagePath: String?
    /// wire: `title`. Display title.
    public let title: String?
    /// wire: `thumbnailUrl`. Thumbnail URL.
    public let thumbnailUrl: String?
    /// wire: `extra`. Mini program extension fields.
    public let extra: [String: String]?

    public init(conversationId: String = "", appId: String = "", pagePath: String? = nil, title: String? = nil, thumbnailUrl: String? = nil, extra: [String: String]? = nil) {
        self.conversationId = conversationId
        self.appId = appId
        self.pagePath = pagePath
        self.title = title
        self.thumbnailUrl = thumbnailUrl
        self.extra = extra
    }
}
