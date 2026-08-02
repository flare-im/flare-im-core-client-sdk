package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a task message.
public class BuildTaskMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `taskId`. Task id.
    public let taskId: String
    // wire: `title`. Task title.
    public let title: String
    // wire: `status`. Optional. Task status.
    public let status: ?String
    // wire: `participantUserIds`. Task participants.
    public let participantUserIds: String

    public init(conversationId!: String, taskId!: String, title!: String, status!: ?String, participantUserIds!: String) {
        this.conversationId = conversationId
        this.taskId = taskId
        this.title = title
        this.status = status
        this.participantUserIds = participantUserIds
    }
}
