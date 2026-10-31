package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Response of loadOlderTimeline, loadNewerTimeline and jumpToLatestTimeline. The rows themselves arrive only through view.updated.
public class TimelineViewPageResponse {
    // wire: `viewId`. Timeline view id.
    public let viewId: String
    // wire: `loadedCount`. Rows this call added to the window.
    public let loadedCount: UInt32
    // wire: `revision`. Revision that contains this page (0 when the view was already closed).
    public let revision: UInt64

    public init(viewId!: String, loadedCount!: UInt32, revision!: UInt64) {
        this.viewId = viewId
        this.loadedCount = loadedCount
        this.revision = revision
    }
}
