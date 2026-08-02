import Foundation

/// GENERATED. Do not edit by hand.
/// Build a schedule message.
public struct BuildScheduleMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `scheduleId`. Schedule id.
    public let scheduleId: String
    /// wire: `title`. Schedule title.
    public let title: String
    /// wire: `startTimeMs`. Start time in milliseconds since epoch.
    public let startTimeMs: Int64
    /// wire: `endTimeMs`. End time in milliseconds since epoch.
    public let endTimeMs: Int64
    /// wire: `participantUserIds`. Schedule participants.
    public let participantUserIds: [String]

    public init(conversationId: String = "", scheduleId: String = "", title: String = "", startTimeMs: Int64 = 0, endTimeMs: Int64 = 0, participantUserIds: [String] = []) {
        self.conversationId = conversationId
        self.scheduleId = scheduleId
        self.title = title
        self.startTimeMs = startTimeMs
        self.endTimeMs = endTimeMs
        self.participantUserIds = participantUserIds
    }
}
