package flare_core_harmony_cangjie_sdk.model.command.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Create a text message draft for a conversation.
public class CreateTextMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `text`. Text body.
    public let text: String

    public init(conversationId!: String, text!: String) {
        this.conversationId = conversationId
        this.text = text
    }
}
