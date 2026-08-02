package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Response returned when opening an observable view.
public class ViewOpenResponse {
    // wire: `viewId`. Opened view id.
    public let viewId: String
    // wire: `snapshot`. Initial snapshot for this view.
    public let snapshot: ViewSnapshot

    public init(viewId!: String, snapshot!: ViewSnapshot) {
        this.viewId = viewId
        this.snapshot = snapshot
    }
}
