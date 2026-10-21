package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// 
public class PluginCommandRequest {
    // wire: `payload`. prepare: slot + command; pending: slot; submit/acknowledge: slot + commandId. Scope is inferred from the active SDK session.
    public let payload: String

    public init(payload!: String) {
        this.payload = payload
    }
}
