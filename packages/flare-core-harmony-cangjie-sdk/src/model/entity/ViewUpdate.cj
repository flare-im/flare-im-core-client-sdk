package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Observable view update event payload (view.updated). Every update a view publishes carries the next revision; a host that sees a revision that is not its applied revision plus 1 drops it when it is not newer, otherwise replaces its window with timelineSnapshot.
public class ViewUpdate {
    // wire: `viewId`. Updated view id.
    public let viewId: String
    // wire: `revision`. Revision this update brings the view to.
    public let revision: UInt64
    // wire: `kind`. Update kind: snapshot or delta.
    public let kind: String
    // wire: `snapshot`. Optional. Whole view when kind is snapshot.
    public let snapshot: ?ViewSnapshot
    // wire: `delta`. Optional. View delta when kind is delta.
    public let delta: ?ViewDelta

    public init(viewId!: String, revision!: UInt64, kind!: String, snapshot!: ?ViewSnapshot, delta!: ?ViewDelta) {
        this.viewId = viewId
        this.revision = revision
        this.kind = kind
        this.snapshot = snapshot
        this.delta = delta
    }
}
