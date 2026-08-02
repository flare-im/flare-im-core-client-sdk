import Foundation

/// GENERATED. Do not edit by hand.
/// Runtime NAT timeout hint for adaptive heartbeat scheduling. Omit or pass null to clear the hint.
public struct SetHeartbeatNatTimeoutRequest: Codable, Sendable {
    /// wire: `natTimeoutSecs`. Observed NAT idle timeout in seconds.
    public let natTimeoutSecs: UInt32?

    public init(natTimeoutSecs: UInt32? = nil) {
        self.natTimeoutSecs = natTimeoutSecs
    }
}
