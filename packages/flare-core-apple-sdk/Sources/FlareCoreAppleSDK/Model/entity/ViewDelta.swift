import Foundation

/// GENERATED. Do not edit by hand.
/// Typed delta emitted by core observable views.
public struct ViewDelta: Sendable {
    /// wire: `viewType`. Delta tag: timeline or conversationList.
    public let viewType: String
    /// wire: `ops`. Ordered delta operations.
    public let ops: [ViewDeltaOp]
    /// wire: `conversation`. Latest timeline conversation header for timeline deltas.
    public let conversation: Conversation?
    /// wire: `hasMore`. Latest timeline pagination state for timeline deltas.
    public let hasMore: Bool?
    /// wire: `totalUnread`. Latest total unread value for conversation list deltas.
    public let totalUnread: UInt64?
    /// wire: `syncState`. Latest sync state for conversation list deltas.
    public let syncState: String?

    public init(viewType: String = "", ops: [ViewDeltaOp] = [], conversation: Conversation? = nil, hasMore: Bool? = nil, totalUnread: UInt64? = nil, syncState: String? = nil) {
        self.viewType = viewType
        self.ops = ops
        self.conversation = conversation
        self.hasMore = hasMore
        self.totalUnread = totalUnread
        self.syncState = syncState
    }
}
