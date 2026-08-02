import Foundation

/// GENERATED. Do not edit by hand.
/// Runtime health snapshot including metrics and event drop counters.
public struct RuntimeHealthResponse: Codable, Sendable {
    /// wire: `metricsEnabled`. Whether SDK metrics collection is enabled for this session.
    public let metricsEnabled: Bool
    /// wire: `state`. Current SDK connection state.
    public let state: String
    /// wire: `stateCode`. Numeric SDK state code used by lower-level FFI state calls.
    public let stateCode: Int32
    /// wire: `sessionGeneration`. Current SDK session generation.
    public let sessionGeneration: UInt64
    /// wire: `rawSubscriberDroppedTotal`. Total raw subscriber events dropped because bounded queues were full.
    public let rawSubscriberDroppedTotal: UInt64
    /// wire: `metricsJson`. JSON string for the metrics snapshot containing counters, gauges, and histograms.
    public let metricsJson: String

    public init(metricsEnabled: Bool = false, state: String = "", stateCode: Int32 = 0, sessionGeneration: UInt64 = 0, rawSubscriberDroppedTotal: UInt64 = 0, metricsJson: String = "") {
        self.metricsEnabled = metricsEnabled
        self.state = state
        self.stateCode = stateCode
        self.sessionGeneration = sessionGeneration
        self.rawSubscriberDroppedTotal = rawSubscriberDroppedTotal
        self.metricsJson = metricsJson
    }
}
