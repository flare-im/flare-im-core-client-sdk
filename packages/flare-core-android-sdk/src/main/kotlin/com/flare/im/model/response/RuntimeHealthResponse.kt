package com.flare.im.model.response

/** GENERATED. Do not edit by hand. */
/** Runtime health snapshot including metrics and event drop counters. */
data class RuntimeHealthResponse(
    /** wire: `metricsEnabled`. Whether SDK metrics collection is enabled for this session. */
    val metricsEnabled: Boolean = false,
    /** wire: `state`. Current SDK connection state. */
    val state: String = "",
    /** wire: `stateCode`. Numeric SDK state code used by lower-level FFI state calls. */
    val stateCode: Int = 0,
    /** wire: `sessionGeneration`. Current SDK session generation. */
    val sessionGeneration: Long = 0L,
    /** wire: `rawSubscriberDroppedTotal`. Total raw subscriber events dropped because bounded queues were full. */
    val rawSubscriberDroppedTotal: Long = 0L,
    /** wire: `metricsJson`. JSON string for the metrics snapshot containing counters, gauges, and histograms. */
    val metricsJson: String = "",
)
