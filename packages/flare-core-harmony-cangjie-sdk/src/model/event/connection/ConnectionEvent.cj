package flare_core_harmony_cangjie_sdk.model.event.connection

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Connection notification payload.
public class ConnectionEvent {
    // wire: `name`. Connection event name.
    public let name: ConnectionEventName
    // wire: `state`. Connection state after this event.
    public let state: SdkConnectionState
    // wire: `reason`. Optional. Disconnect, kicked-off, or token-expired reason.
    public let reason: ?String
    // wire: `attempt`. Optional. Reconnect attempt number.
    public let attempt: ?UInt32
    // wire: `error`. Optional. Server or reconnect failure details.
    public let error: ?SdkErrorPayload

    public init(name!: ConnectionEventName, state!: SdkConnectionState, reason!: ?String, attempt!: ?UInt32, error!: ?SdkErrorPayload) {
        this.name = name
        this.state = state
        this.reason = reason
        this.attempt = attempt
        this.error = error
    }
}
