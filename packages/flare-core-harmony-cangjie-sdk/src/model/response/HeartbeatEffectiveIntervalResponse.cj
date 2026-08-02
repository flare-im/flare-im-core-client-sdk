package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Currently effective heartbeat interval for diagnostics and platform observability.
public class HeartbeatEffectiveIntervalResponse {
    // wire: `connected`. Whether a live transport is available.
    public let connected: Bool
    // wire: `intervalMs`. Optional. Effective heartbeat interval in milliseconds when connected.
    public let intervalMs: ?UInt64
    // wire: `intervalSecs`. Optional. Effective heartbeat interval in seconds when connected.
    public let intervalSecs: ?UInt64

    public init(connected!: Bool, intervalMs!: ?UInt64, intervalSecs!: ?UInt64) {
        this.connected = connected
        this.intervalMs = intervalMs
        this.intervalSecs = intervalSecs
    }
}
