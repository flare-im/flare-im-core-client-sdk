import Foundation

/// GENERATED. Do not edit by hand.
/// Presence notification payload.
public struct PresenceChangedEvent: Codable, Sendable {
    /// wire: `conversationId`. Conversation id when presence is scoped to a conversation.
    public let conversationId: String?
    /// wire: `userId`. User id.
    public let userId: String
    /// wire: `status`. Presence status.
    public let status: String
    /// wire: `extra`. Opaque presence details.
    public let extra: [String: String]

    public init(conversationId: String? = nil, userId: String = "", status: String = "", extra: [String: String] = [:]) {
        self.conversationId = conversationId
        self.userId = userId
        self.status = status
        self.extra = extra
    }
}
