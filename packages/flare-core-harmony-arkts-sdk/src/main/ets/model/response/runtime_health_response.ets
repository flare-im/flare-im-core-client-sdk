// GENERATED. Do not edit by hand.

/** Runtime health snapshot including metrics and event drop counters. */
export interface RuntimeHealthResponse {
  /** wire: `metricsEnabled`. Whether SDK metrics collection is enabled for this session. */
  metricsEnabled: boolean;
  /** wire: `state`. Current SDK connection state. */
  state: string;
  /** wire: `stateCode`. Numeric SDK state code used by lower-level FFI state calls. */
  stateCode: number;
  /** wire: `sessionGeneration`. Current SDK session generation. */
  sessionGeneration: number;
  /** wire: `rawSubscriberDroppedTotal`. Total raw subscriber events dropped because bounded queues were full. */
  rawSubscriberDroppedTotal: number;
  /** wire: `metricsJson`. JSON string for the metrics snapshot containing counters, gauges, and histograms. */
  metricsJson: string;
}
