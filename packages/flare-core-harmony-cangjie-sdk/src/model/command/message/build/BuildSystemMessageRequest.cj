package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a system message.
public class BuildSystemMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `eventKind`. System event kind.
    public let eventKind: String
    // wire: `body`. System event body.
    public let body: String

    public init(conversationId!: String, eventKind!: String, body!: String) {
        this.conversationId = conversationId
        this.eventKind = eventKind
        this.body = body
    }
}
