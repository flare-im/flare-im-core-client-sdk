import Foundation

/// GENERATED. Do not edit by hand.
/// Request for opening an observable conversation timeline view.
public struct OpenTimelineViewRequest: Codable, Sendable {
    /// wire: `conversationId`. Conversation id to observe.
    public let conversationId: String
    /// wire: `messageLimit`. Page size: rows in the initial window and in each older or newer page when a paging request does not give its own (core default 40, at most 100).
    public let messageLimit: UInt32
    /// wire: `anchor`. Open around this message instead of at the latest messages; the window holds half a page on each side of it.
    public let anchor: TimelineAnchor?

    public init(conversationId: String = "", messageLimit: UInt32 = 0, anchor: TimelineAnchor? = nil) {
        self.conversationId = conversationId
        self.messageLimit = messageLimit
        self.anchor = anchor
    }
}
