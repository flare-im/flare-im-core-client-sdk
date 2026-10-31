import Foundation

/// GENERATED. Do not edit by hand.
/// Request for extending a timeline view that is not attached to the latest with newer messages.
public struct LoadNewerTimelineViewRequest: Codable, Sendable {
    /// wire: `viewId`. Timeline view id returned from openTimeline.
    public let viewId: String
    /// wire: `messageLimit`. Maximum newer messages to load in this page.
    public let messageLimit: UInt32

    public init(viewId: String = "", messageLimit: UInt32 = 0) {
        self.viewId = viewId
        self.messageLimit = messageLimit
    }
}
