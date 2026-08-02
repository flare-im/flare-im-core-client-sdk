package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build an image group message.
public class BuildImageGroupMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `payload`. Image group payload.
    public let payload: ImageGroupContentPayload

    public init(conversationId!: String, payload!: ImageGroupContentPayload) {
        this.conversationId = conversationId
        this.payload = payload
    }
}
