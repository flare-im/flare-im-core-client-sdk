import Foundation

/// GENERATED. Do not edit by hand.
/// Result of handling a platform network-change notification.
public struct NetworkChangeResponse: Codable, Sendable {
    /// wire: `reconnected`. Whether the SDK had an active session and attempted reconnect.
    public let reconnected: Bool

    public init(reconnected: Bool = false) {
        self.reconnected = reconnected
    }
}
