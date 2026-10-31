package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request naming an open timeline view (jumpToLatestTimeline, timelineSnapshot).
public class TimelineViewRequest {
    // wire: `viewId`. Timeline view id returned from openTimeline.
    public let viewId: String

    public init(viewId!: String) {
        this.viewId = viewId
    }
}
