package com.flare.im.model.event.lifecycle

import com.flare.im.model.common.error.SdkErrorPayload

/** GENERATED. Do not edit by hand. */
/** Lifecycle notification. Method return values remain the primary success/failure contract. */
data class LifecycleEvent(
    /** wire: `name`. Lifecycle event name. */
    val name: LifecycleEventName,
    /** wire: `operation`. Operation associated with this lifecycle event. */
    val operation: String = "",
    /** wire: `userId`. Current user id when known. */
    val userId: String? = null,
    /** wire: `sessionId`. SDK session id when available. */
    val sessionId: String? = null,
    /** wire: `error`. Failure details for *_failed events. */
    val error: SdkErrorPayload? = null,
)
