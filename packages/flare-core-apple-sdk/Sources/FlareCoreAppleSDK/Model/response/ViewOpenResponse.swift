import Foundation

/// GENERATED. Do not edit by hand.
/// Response returned when opening an observable view.
public struct ViewOpenResponse: Sendable {
    /// wire: `viewId`. Opened view id.
    public let viewId: String
    /// wire: `snapshot`. Initial snapshot for this view.
    public let snapshot: ViewSnapshot

    public init(viewId: String = "", snapshot: ViewSnapshot) {
        self.viewId = viewId
        self.snapshot = snapshot
    }
}
