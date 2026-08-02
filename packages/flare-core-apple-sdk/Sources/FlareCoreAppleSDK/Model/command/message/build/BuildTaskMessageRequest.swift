import Foundation

/// GENERATED. Do not edit by hand.
/// Build a task message.
public struct BuildTaskMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `taskId`. Task id.
    public let taskId: String
    /// wire: `title`. Task title.
    public let title: String
    /// wire: `status`. Task status.
    public let status: String?
    /// wire: `participantUserIds`. Task participants.
    public let participantUserIds: [String]

    public init(conversationId: String = "", taskId: String = "", title: String = "", status: String? = nil, participantUserIds: [String] = []) {
        self.conversationId = conversationId
        self.taskId = taskId
        self.title = title
        self.status = status
        self.participantUserIds = participantUserIds
    }
}
