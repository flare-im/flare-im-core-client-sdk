import Foundation

/// GENERATED. Do not edit by hand.
/// Response returned when opening an observable view and by timelineSnapshot.
public struct ViewOpenResponse: Sendable {
    /// wire: `viewId`. View id.
    public let viewId: String
    /// wire: `revision`. Revision of this snapshot; every later view.updated event for the view carries the next revision.
    public let revision: UInt64
    /// wire: `snapshot`. Snapshot of the view at that revision.
    public let snapshot: ViewSnapshot

    public init(viewId: String = "", revision: UInt64 = 0, snapshot: ViewSnapshot) {
        self.viewId = viewId
        self.revision = revision
        self.snapshot = snapshot
    }
}
