import Foundation

/// GENERATED. Do not edit by hand.
/// Core-owned unread total for the conversations tab badge.
public struct ConversationTotalUnreadResponse: Codable, Sendable {
    /// wire: `totalUnread`. Unread total across all conversations: archived ones count nothing, muted ones count only their mentions.
    public let totalUnread: UInt64

    public init(totalUnread: UInt64 = 0) {
        self.totalUnread = totalUnread
    }
}
