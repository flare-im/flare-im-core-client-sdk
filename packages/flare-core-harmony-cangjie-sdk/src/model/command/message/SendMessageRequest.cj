package flare_core_harmony_cangjie_sdk.model.command.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Send a fully built message.
public class SendMessageRequest {
    // wire: `message`. Message to send.
    public let message: Message

    public init(message!: Message) {
        this.message = message
    }
}
