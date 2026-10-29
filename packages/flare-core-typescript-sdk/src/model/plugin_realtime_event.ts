/** GENERATED. Do not edit by hand. */

/** A plugin realtime packet (im.realtime.deliver). Online only, at most once, never stored; the SDK drops expired packets and payloads that are not JSON objects. */
export interface PluginRealtimeEvent {
  /** wire: `pluginId`. Delivering plugin id, e.g. flare.call. */
  pluginId: string;
  /** wire: `packetType`. Plugin packet type, e.g. call.snapshot. */
  packetType: string;
  /** wire: `conversationId`. Conversation the plugin delivered to. */
  conversationId: string;
  /** wire: `payload`. Plugin-defined JSON object payload. */
  payload: Record<string, unknown>;
  /** wire: `deliveryId`. Core delivery id of this packet. */
  deliveryId: string;
  /** wire: `expiresAtMs`. Wall-clock milliseconds after which the packet is stale. */
  expiresAtMs: number;
}
