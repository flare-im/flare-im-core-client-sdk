// GENERATED. Do not edit by hand.

/// Read receipt notification.
final class ReadReceiptEvent {
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `userId`. Reader user id.
  final String userId;
  /// wire: `readSeq`. Read sequence.
  final int readSeq;

  const ReadReceiptEvent({
    this.conversationId = '',
    this.userId = '',
    this.readSeq = 0,
  });
}
