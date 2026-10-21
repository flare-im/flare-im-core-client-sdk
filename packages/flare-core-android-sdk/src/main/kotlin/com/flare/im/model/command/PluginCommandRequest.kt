package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/**  */
data class PluginCommandRequest(
    /** wire: `payload`. prepare: slot + command; pending: slot; submit/acknowledge: slot + commandId. Scope is inferred from the active SDK session. */
    val payload: Map<String, Any?> = emptyMap(),
)
