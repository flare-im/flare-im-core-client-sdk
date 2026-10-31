import Foundation

/// GENERATED. Do not edit by hand.
/// Observable view update event payload (view.updated). Every update a view publishes carries the next revision; a host that sees a revision that is not its applied revision plus 1 drops it when it is not newer, otherwise replaces its window with timelineSnapshot.
public struct ViewUpdate: Sendable {
    /// wire: `viewId`. Updated view id.
    public let viewId: String
    /// wire: `revision`. Revision this update brings the view to.
    public let revision: UInt64
    /// wire: `kind`. Update kind: snapshot or delta.
    public let kind: String
    /// wire: `snapshot`. Whole view when kind is snapshot.
    public let snapshot: ViewSnapshot?
    /// wire: `delta`. View delta when kind is delta.
    public let delta: ViewDelta?

    public init(viewId: String = "", revision: UInt64 = 0, kind: String = "", snapshot: ViewSnapshot? = nil, delta: ViewDelta? = nil) {
        self.viewId = viewId
        self.revision = revision
        self.kind = kind
        self.snapshot = snapshot
        self.delta = delta
    }
}
