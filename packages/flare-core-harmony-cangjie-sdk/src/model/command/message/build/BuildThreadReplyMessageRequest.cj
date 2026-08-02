package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a thread reply message.
public class BuildThreadReplyMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `threadId`. Thread root message id.
    public let threadId: String
    // wire: `text`. Reply text.
    public let text: String

    public init(conversationId!: String, threadId!: String, text!: String) {
        this.conversationId = conversationId
        this.threadId = threadId
        this.text = text
    }
}
