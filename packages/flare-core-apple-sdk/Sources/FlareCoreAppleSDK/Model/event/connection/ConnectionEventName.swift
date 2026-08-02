import Foundation

/// GENERATED. Do not edit by hand.
/// Connection event notification name.
public enum ConnectionEventName: String, Codable, Sendable {
    case connecting = "connecting"
    case connected = "connected"
    case ready = "ready"
    case disconnected = "disconnected"
    case reconnecting = "reconnecting"
    case reconnectFailed = "reconnect_failed"
    case stateChanged = "state_changed"
    case syncStateChanged = "sync_state_changed"
    case serverError = "server_error"
    case kickedOff = "kicked_off"
    case tokenExpired = "token_expired"
}
