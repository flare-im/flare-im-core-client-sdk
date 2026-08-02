package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a text message.
public class BuildTextMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `text`. Text body.
    public let text: String
    // wire: `mentionUsers`. Optional. User ids mentioned in the text body. The core builder resolves @userId spans into typed mentions.
    public let mentionUsers: ?String
    // wire: `mentionAll`. Optional. Whether the message mentions every member in the target conversation.
    public let mentionAll: ?Bool

    public init(conversationId!: String, text!: String, mentionUsers!: ?String, mentionAll!: ?Bool) {
        this.conversationId = conversationId
        this.text = text
        this.mentionUsers = mentionUsers
        this.mentionAll = mentionAll
    }
}
