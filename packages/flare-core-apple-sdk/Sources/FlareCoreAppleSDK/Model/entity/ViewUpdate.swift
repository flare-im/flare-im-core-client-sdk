import Foundation

/// GENERATED. Do not edit by hand.
/// Observable view update event payload.
public struct ViewUpdate: Sendable {
    /// wire: `viewId`. Updated view id.
    public let viewId: String
    /// wire: `kind`. Update kind: snapshot or delta.
    public let kind: String
    /// wire: `snapshot`. Latest snapshot for this view when kind is snapshot.
    public let snapshot: ViewSnapshot?
    /// wire: `delta`. View delta when kind is delta.
    public let delta: ViewDelta?

    public init(viewId: String = "", kind: String = "", snapshot: ViewSnapshot? = nil, delta: ViewDelta? = nil) {
        self.viewId = viewId
        self.kind = kind
        self.snapshot = snapshot
        self.delta = delta
    }
}
