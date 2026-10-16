package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** PushLifecycleStatus */
data class PushLifecycleStatus(
    /** wire: `configuredProviders`. Number of OS providers configured in memory. */
    val configuredProviders: Int = 0,
    /** wire: `lastError`. Fixed safe error category; no token, URL, bearer or driver detail. */
    val lastError: String? = null,
    /** wire: `pendingRevocations`. Unresolved revoke intents, including writes with an unknown result. */
    val pendingRevocations: Int = 0,
    /** wire: `registeredProviders`. Providers confirmed for the current session, not vendor delivery. */
    val registeredProviders: Int = 0,
    /** wire: `state`. disabled, waitingForSession, waitingForToken, pending or registered. */
    val state: String = "",
)
