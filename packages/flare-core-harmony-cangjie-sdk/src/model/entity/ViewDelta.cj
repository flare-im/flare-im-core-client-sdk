package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Typed delta emitted by core observable views.
public class ViewDelta {
    // wire: `viewType`. Delta tag: timeline or conversationList.
    public let viewType: String
    // wire: `ops`. Ordered delta operations.
    public let ops: String
    // wire: `conversation`. Optional. Latest timeline conversation header for timeline deltas.
    public let conversation: ?Conversation
    // wire: `hasMore`. Optional. Latest timeline pagination state for timeline deltas.
    public let hasMore: ?Bool
    // wire: `totalUnread`. Optional. Latest total unread value for conversation list deltas.
    public let totalUnread: ?UInt64
    // wire: `syncState`. Optional. Latest sync state for conversation list deltas.
    public let syncState: ?String

    public init(viewType!: String, ops!: String, conversation!: ?Conversation, hasMore!: ?Bool, totalUnread!: ?UInt64, syncState!: ?String) {
        this.viewType = viewType
        this.ops = ops
        this.conversation = conversation
        this.hasMore = hasMore
        this.totalUnread = totalUnread
        this.syncState = syncState
    }
}
