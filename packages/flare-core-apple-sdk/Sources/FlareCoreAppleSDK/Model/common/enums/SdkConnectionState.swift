import Foundation

/// GENERATED. Do not edit by hand.
/// Connection state exposed by event payloads.
public enum SdkConnectionState: String, Codable, Sendable {
    case disconnected = "disconnected"
    case connecting = "connecting"
    case connected = "connected"
    case ready = "ready"
    case reconnecting = "reconnecting"
}
