import Foundation

/// GENERATED. Do not edit by hand.
/// Build a notification message.
public struct BuildNotificationMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `title`. Notification title.
    public let title: String
    /// wire: `body`. Notification body.
    public let body: String

    public init(conversationId: String = "", title: String = "", body: String = "") {
        self.conversationId = conversationId
        self.title = title
        self.body = body
    }
}
