import Foundation

/// GENERATED. Do not edit by hand.
/// Request naming an open timeline view (jumpToLatestTimeline, timelineSnapshot).
public struct TimelineViewRequest: Codable, Sendable {
    /// wire: `viewId`. Timeline view id returned from openTimeline.
    public let viewId: String

    public init(viewId: String = "") {
        self.viewId = viewId
    }
}
