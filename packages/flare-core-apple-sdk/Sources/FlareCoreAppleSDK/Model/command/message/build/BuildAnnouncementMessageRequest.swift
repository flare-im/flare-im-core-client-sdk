import Foundation

/// GENERATED. Do not edit by hand.
/// Build an announcement message.
public struct BuildAnnouncementMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `title`. Announcement title.
    public let title: String
    /// wire: `body`. Announcement body.
    public let body: String

    public init(conversationId: String = "", title: String = "", body: String = "") {
        self.conversationId = conversationId
        self.title = title
        self.body = body
    }
}
