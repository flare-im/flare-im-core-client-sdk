package flare_core_harmony_cangjie_sdk.model.event.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Batch message received notification.
public class MessageReceivedBatchEvent {
    // wire: `messages`. Received messages.
    public let messages: String

    public init(messages!: String) {
        this.messages = messages
    }
}
