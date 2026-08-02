package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a placeholder message.
public class BuildPlaceholderMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `reason`. Placeholder reason.
    public let reason: String

    public init(conversationId!: String, reason!: String) {
        this.conversationId = conversationId
        this.reason = reason
    }
}
