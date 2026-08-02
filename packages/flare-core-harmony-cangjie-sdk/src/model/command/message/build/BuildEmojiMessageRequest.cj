package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build an emoji message.
public class BuildEmojiMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `emoji`. Emoji key.
    public let emoji: String

    public init(conversationId!: String, emoji!: String) {
        this.conversationId = conversationId
        this.emoji = emoji
    }
}
