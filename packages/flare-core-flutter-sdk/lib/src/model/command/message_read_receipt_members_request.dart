// GENERATED. Do not edit by hand.

/// One page of the members who read, or have not yet read, one of the viewer's own group messages (the read receipt sheet).
final class MessageReadReceiptMembersRequest {
  /// wire: `payload`. {conversationId, serverMsgId, state: "read" | "unread", cursor?, limit?}; limit 1..=200 (default 50), cursor the previous page's nextCursor (absent for the first page).
  final Map<String, Object?> payload;

  const MessageReadReceiptMembersRequest({
    this.payload = const {},
  });
}
