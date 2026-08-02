import Foundation

/// GENERATED. Do not edit by hand.
/// Connection notification payload.
public struct ConnectionEvent: Codable, Sendable {
    /// wire: `name`. Connection event name.
    public let name: ConnectionEventName
    /// wire: `state`. Connection state after this event.
    public let state: SdkConnectionState
    /// wire: `reason`. Disconnect, kicked-off, or token-expired reason.
    public let reason: String?
    /// wire: `attempt`. Reconnect attempt number.
    public let attempt: UInt32?
    /// wire: `error`. Server or reconnect failure details.
    public let error: SdkErrorPayload?

    public init(name: ConnectionEventName, state: SdkConnectionState, reason: String? = nil, attempt: UInt32? = nil, error: SdkErrorPayload? = nil) {
        self.name = name
        self.state = state
        self.reason = reason
        self.attempt = attempt
        self.error = error
    }
}
