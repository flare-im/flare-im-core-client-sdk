import Foundation

/// GENERATED. Do not edit by hand.
/// Response of loadOlderTimeline, loadNewerTimeline and jumpToLatestTimeline. The rows themselves arrive only through view.updated.
public struct TimelineViewPageResponse: Codable, Sendable {
    /// wire: `viewId`. Timeline view id.
    public let viewId: String
    /// wire: `loadedCount`. Rows this call added to the window.
    public let loadedCount: UInt32
    /// wire: `revision`. Revision that contains this page (0 when the view was already closed).
    public let revision: UInt64

    public init(viewId: String = "", loadedCount: UInt32 = 0, revision: UInt64 = 0) {
        self.viewId = viewId
        self.loadedCount = loadedCount
        self.revision = revision
    }
}
