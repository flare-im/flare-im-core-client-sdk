package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Result of handling a platform network-change notification.
public class NetworkChangeResponse {
    // wire: `reconnected`. Whether the SDK had an active session and attempted reconnect.
    public let reconnected: Bool

    public init(reconnected!: Bool) {
        this.reconnected = reconnected
    }
}
