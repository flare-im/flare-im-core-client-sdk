package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Runtime health snapshot including metrics and event drop counters.
public class RuntimeHealthResponse {
    // wire: `metricsEnabled`. Whether SDK metrics collection is enabled for this session.
    public let metricsEnabled: Bool
    // wire: `state`. Current SDK connection state.
    public let state: String
    // wire: `stateCode`. Numeric SDK state code used by lower-level FFI state calls.
    public let stateCode: Int32
    // wire: `sessionGeneration`. Current SDK session generation.
    public let sessionGeneration: UInt64
    // wire: `rawSubscriberDroppedTotal`. Total raw subscriber events dropped because bounded queues were full.
    public let rawSubscriberDroppedTotal: UInt64
    // wire: `metricsJson`. JSON string for the metrics snapshot containing counters, gauges, and histograms.
    public let metricsJson: String

    public init(metricsEnabled!: Bool, state!: String, stateCode!: Int32, sessionGeneration!: UInt64, rawSubscriberDroppedTotal!: UInt64, metricsJson!: String) {
        this.metricsEnabled = metricsEnabled
        this.state = state
        this.stateCode = stateCode
        this.sessionGeneration = sessionGeneration
        this.rawSubscriberDroppedTotal = rawSubscriberDroppedTotal
        this.metricsJson = metricsJson
    }
}
