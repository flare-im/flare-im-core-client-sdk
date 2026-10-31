// GENERATED. Do not edit by hand.

/// Core-owned unread total for the conversations tab badge.
final class ConversationTotalUnreadResponse {
  /// wire: `totalUnread`. Unread total across all conversations: archived ones count nothing, muted ones count only their mentions.
  final int totalUnread;

  const ConversationTotalUnreadResponse({
    this.totalUnread = 0,
  });
}
