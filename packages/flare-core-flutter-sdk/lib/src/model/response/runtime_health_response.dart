// GENERATED. Do not edit by hand.

/// Runtime health snapshot including metrics and event drop counters.
final class RuntimeHealthResponse {
  /// wire: `metricsEnabled`. Whether SDK metrics collection is enabled for this session.
  final bool metricsEnabled;
  /// wire: `state`. Current SDK connection state.
  final String state;
  /// wire: `stateCode`. Numeric SDK state code used by lower-level FFI state calls.
  final int stateCode;
  /// wire: `sessionGeneration`. Current SDK session generation.
  final int sessionGeneration;
  /// wire: `rawSubscriberDroppedTotal`. Total raw subscriber events dropped because bounded queues were full.
  final int rawSubscriberDroppedTotal;
  /// wire: `metricsJson`. JSON string for the metrics snapshot containing counters, gauges, and histograms.
  final String metricsJson;

  const RuntimeHealthResponse({
    this.metricsEnabled = false,
    this.state = '',
    this.stateCode = 0,
    this.sessionGeneration = 0,
    this.rawSubscriberDroppedTotal = 0,
    this.metricsJson = '',
  });
}
