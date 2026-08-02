package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request for closing an observable view.
public class CloseViewRequest {
    // wire: `viewId`. View id returned from an open view call.
    public let viewId: String

    public init(viewId!: String) {
        this.viewId = viewId
    }
}
