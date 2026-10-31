package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Core-owned unread total for the conversations tab badge.
public class ConversationTotalUnreadResponse {
    // wire: `totalUnread`. Unread total across all conversations: archived ones count nothing, muted ones count only their mentions.
    public let totalUnread: UInt64

    public init(totalUnread!: UInt64) {
        this.totalUnread = totalUnread
    }
}
