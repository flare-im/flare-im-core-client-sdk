package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// 
public class PluginUiEvaluationRequest {
    // wire: `payload`. Typed UI evaluation envelope defined by the shared UI protocol. presentPluginMessage and invokePluginAction accept an optional messageId (server id or clientMsgId) of the message the card belongs to: present overlays the plugin state stored on that message, invoke stores a successful operation's data.messageState on it.
    public let payload: String

    public init(payload!: String) {
        this.payload = payload
    }
}
