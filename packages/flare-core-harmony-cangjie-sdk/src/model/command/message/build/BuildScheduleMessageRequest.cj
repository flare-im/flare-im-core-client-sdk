package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a schedule message.
public class BuildScheduleMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `scheduleId`. Schedule id.
    public let scheduleId: String
    // wire: `title`. Schedule title.
    public let title: String
    // wire: `startTimeMs`. Start time in milliseconds since epoch.
    public let startTimeMs: Int64
    // wire: `endTimeMs`. End time in milliseconds since epoch.
    public let endTimeMs: Int64
    // wire: `participantUserIds`. Schedule participants.
    public let participantUserIds: String

    public init(conversationId!: String, scheduleId!: String, title!: String, startTimeMs!: Int64, endTimeMs!: Int64, participantUserIds!: String) {
        this.conversationId = conversationId
        this.scheduleId = scheduleId
        this.title = title
        this.startTimeMs = startTimeMs
        this.endTimeMs = endTimeMs
        this.participantUserIds = participantUserIds
    }
}
