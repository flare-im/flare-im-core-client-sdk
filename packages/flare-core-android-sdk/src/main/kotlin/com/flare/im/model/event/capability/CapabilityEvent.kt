package com.flare.im.model.event.capability

/** GENERATED. Do not edit by hand. */
/** Capability/plugin notification payload. */
data class CapabilityEvent(
    /** wire: `name`. Capability event name. */
    val name: CapabilityEventName,
    /** wire: `capability`. Capability key. */
    val capability: String? = null,
    /** wire: `reason`. Unavailable/change reason. */
    val reason: String? = null,
)
