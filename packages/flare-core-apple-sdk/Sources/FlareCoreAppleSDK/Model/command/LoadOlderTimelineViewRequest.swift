import Foundation

/// GENERATED. Do not edit by hand.
/// Request for extending an open timeline view with older messages.
public struct LoadOlderTimelineViewRequest: Codable, Sendable {
    /// wire: `viewId`. Timeline view id returned from openTimeline.
    public let viewId: String
    /// wire: `messageLimit`. Maximum older messages to load in this page.
    public let messageLimit: UInt32

    public init(viewId: String = "", messageLimit: UInt32 = 0) {
        self.viewId = viewId
        self.messageLimit = messageLimit
    }
}
