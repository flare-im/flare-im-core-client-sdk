package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Observable view update event payload.
public class ViewUpdate {
    // wire: `viewId`. Updated view id.
    public let viewId: String
    // wire: `kind`. Update kind: snapshot or delta.
    public let kind: String
    // wire: `snapshot`. Optional. Latest snapshot for this view when kind is snapshot.
    public let snapshot: ?ViewSnapshot
    // wire: `delta`. Optional. View delta when kind is delta.
    public let delta: ?ViewDelta

    public init(viewId!: String, kind!: String, snapshot!: ?ViewSnapshot, delta!: ?ViewDelta) {
        this.viewId = viewId
        this.kind = kind
        this.snapshot = snapshot
        this.delta = delta
    }
}
