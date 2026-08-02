package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Runtime NAT timeout hint for adaptive heartbeat scheduling. Omit or pass null to clear the hint. */
data class SetHeartbeatNatTimeoutRequest(
    /** wire: `natTimeoutSecs`. Observed NAT idle timeout in seconds. */
    val natTimeoutSecs: Int? = null,
)
