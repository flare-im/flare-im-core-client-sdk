import Foundation

/// GENERATED. Do not edit by hand.
/// 
public struct PluginUiEvaluationRequest: Sendable {
    /// wire: `payload`. Typed UI evaluation envelope defined by the shared UI protocol. presentPluginMessage and invokePluginAction accept an optional messageId (server id or clientMsgId) of the message the card belongs to: present overlays the plugin state stored on that message, invoke stores a successful operation's data.messageState on it.
    public let payload: [String: AnySendable]

    public init(payload: [String: AnySendable] = [:]) {
        self.payload = payload
    }
}
