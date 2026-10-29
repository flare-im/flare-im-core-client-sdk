// GENERATED. Do not edit by hand.

/// A plugin realtime packet (im.realtime.deliver). Online only, at most once, never stored; the SDK drops expired packets and payloads that are not JSON objects.
final class PluginRealtimeEvent {
  /// wire: `pluginId`. Delivering plugin id, e.g. flare.call.
  final String pluginId;
  /// wire: `packetType`. Plugin packet type, e.g. call.snapshot.
  final String packetType;
  /// wire: `conversationId`. Conversation the plugin delivered to.
  final String conversationId;
  /// wire: `payload`. Plugin-defined JSON object payload.
  final Map<String, Object?> payload;
  /// wire: `deliveryId`. Core delivery id of this packet.
  final String deliveryId;
  /// wire: `expiresAtMs`. Wall-clock milliseconds after which the packet is stale.
  final int expiresAtMs;

  const PluginRealtimeEvent({
    this.pluginId = '',
    this.packetType = '',
    this.conversationId = '',
    this.payload = const {},
    this.deliveryId = '',
    this.expiresAtMs = 0,
  });
}
