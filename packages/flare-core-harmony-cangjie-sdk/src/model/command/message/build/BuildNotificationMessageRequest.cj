package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a notification message.
public class BuildNotificationMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `title`. Notification title.
    public let title: String
    // wire: `body`. Notification body.
    public let body: String

    public init(conversationId!: String, title!: String, body!: String) {
        this.conversationId = conversationId
        this.title = title
        this.body = body
    }
}
