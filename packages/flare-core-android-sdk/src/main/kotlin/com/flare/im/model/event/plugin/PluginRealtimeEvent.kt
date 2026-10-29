package com.flare.im.model.event.plugin

/** GENERATED. Do not edit by hand. */
/** A plugin realtime packet (im.realtime.deliver). Online only, at most once, never stored; the SDK drops expired packets and payloads that are not JSON objects. */
data class PluginRealtimeEvent(
    /** wire: `pluginId`. Delivering plugin id, e.g. flare.call. */
    val pluginId: String = "",
    /** wire: `packetType`. Plugin packet type, e.g. call.snapshot. */
    val packetType: String = "",
    /** wire: `conversationId`. Conversation the plugin delivered to. */
    val conversationId: String = "",
    /** wire: `payload`. Plugin-defined JSON object payload. */
    val payload: Map<String, Any?> = emptyMap(),
    /** wire: `deliveryId`. Core delivery id of this packet. */
    val deliveryId: String = "",
    /** wire: `expiresAtMs`. Wall-clock milliseconds after which the packet is stale. */
    val expiresAtMs: Long = 0L,
)
