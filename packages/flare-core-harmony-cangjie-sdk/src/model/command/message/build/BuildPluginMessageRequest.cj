package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Generic safe plugin message over the existing AppCard envelope.
public class BuildPluginMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `payload`. Validated generic plugin message envelope defined by flare-plugin-protocol.
    public let payload: String

    public init(conversationId!: String, payload!: String) {
        this.conversationId = conversationId
        this.payload = payload
    }
}
