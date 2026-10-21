package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/**  */
data class PluginUiEvaluationRequest(
    /** wire: `payload`. Typed UI evaluation envelope defined by the shared UI protocol. presentPluginMessage and invokePluginAction accept an optional messageId (server id or clientMsgId) of the message the card belongs to: present overlays the plugin state stored on that message, invoke stores a successful operation's data.messageState on it. */
    val payload: Map<String, Any?> = emptyMap(),
)
