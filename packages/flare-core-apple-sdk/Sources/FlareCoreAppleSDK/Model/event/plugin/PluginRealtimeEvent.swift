import Foundation

/// GENERATED. Do not edit by hand.
/// A plugin realtime packet (im.realtime.deliver). Online only, at most once, never stored; the SDK drops expired packets and payloads that are not JSON objects.
public struct PluginRealtimeEvent: Sendable {
    /// wire: `pluginId`. Delivering plugin id, e.g. flare.call.
    public let pluginId: String
    /// wire: `packetType`. Plugin packet type, e.g. call.snapshot.
    public let packetType: String
    /// wire: `conversationId`. Conversation the plugin delivered to.
    public let conversationId: String
    /// wire: `payload`. Plugin-defined JSON object payload.
    public let payload: [String: AnySendable]
    /// wire: `deliveryId`. Core delivery id of this packet.
    public let deliveryId: String
    /// wire: `expiresAtMs`. Wall-clock milliseconds after which the packet is stale.
    public let expiresAtMs: UInt64

    public init(pluginId: String = "", packetType: String = "", conversationId: String = "", payload: [String: AnySendable] = [:], deliveryId: String = "", expiresAtMs: UInt64 = 0) {
        self.pluginId = pluginId
        self.packetType = packetType
        self.conversationId = conversationId
        self.payload = payload
        self.deliveryId = deliveryId
        self.expiresAtMs = expiresAtMs
    }
}
