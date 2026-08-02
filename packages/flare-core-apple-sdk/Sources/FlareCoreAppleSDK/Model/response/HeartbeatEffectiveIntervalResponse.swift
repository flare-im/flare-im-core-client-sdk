import Foundation

/// GENERATED. Do not edit by hand.
/// Currently effective heartbeat interval for diagnostics and platform observability.
public struct HeartbeatEffectiveIntervalResponse: Codable, Sendable {
    /// wire: `connected`. Whether a live transport is available.
    public let connected: Bool
    /// wire: `intervalMs`. Effective heartbeat interval in milliseconds when connected.
    public let intervalMs: UInt64?
    /// wire: `intervalSecs`. Effective heartbeat interval in seconds when connected.
    public let intervalSecs: UInt64?

    public init(connected: Bool = false, intervalMs: UInt64? = nil, intervalSecs: UInt64? = nil) {
        self.connected = connected
        self.intervalMs = intervalMs
        self.intervalSecs = intervalSecs
    }
}
