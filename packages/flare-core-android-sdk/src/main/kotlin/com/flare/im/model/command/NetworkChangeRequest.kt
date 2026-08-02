package com.flare.im.model.command

import com.flare.im.model.entity.NetworkInterfaceKind

/** GENERATED. Do not edit by hand. */
/** Platform network-change notification used to trigger active reconnect. */
data class NetworkChangeRequest(
    /** wire: `available`. Whether a network route is currently available. Omitted means available. */
    val available: Boolean? = null,
    /** wire: `interface`. Standardized platform network interface hint. */
    val `interface`: NetworkInterfaceKind? = null,
    /** wire: `expensive`. Whether the active route is considered expensive by the platform. */
    val expensive: Boolean? = null,
    /** wire: `metered`. Whether the active route is metered. */
    val metered: Boolean? = null,
    /** wire: `reason`. Optional platform reason string for diagnostics. */
    val reason: String? = null,
)
