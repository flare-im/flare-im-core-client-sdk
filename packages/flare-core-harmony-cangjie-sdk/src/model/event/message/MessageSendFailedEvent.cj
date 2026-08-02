package flare_core_harmony_cangjie_sdk.model.event.message

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Message send failure notification.
public class MessageSendFailedEvent {
    // wire: `clientMsgId`. Client message id that failed.
    public let clientMsgId: String
    // wire: `reason`. Failure reason.
    public let reason: String
    // wire: `error`. Optional. Structured failure details when available.
    public let error: ?SdkErrorPayload

    public init(clientMsgId!: String, reason!: String, error!: ?SdkErrorPayload) {
        this.clientMsgId = clientMsgId
        this.reason = reason
        this.error = error
    }
}
