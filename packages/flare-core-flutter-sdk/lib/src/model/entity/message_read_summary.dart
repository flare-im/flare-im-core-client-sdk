// GENERATED. Do not edit by hand.

/// Who read one of the viewer's own messages in a group, the sender excluded: total = readCount + unreadCount, always above 0.
final class MessageReadSummary {
  /// wire: `readCount`. Members who read the message.
  final int readCount;
  /// wire: `unreadCount`. Members who have not read it yet.
  final int unreadCount;
  /// wire: `total`. Members the message counts, the sender excluded.
  final int total;

  const MessageReadSummary({
    this.readCount = 0,
    this.unreadCount = 0,
    this.total = 0,
  });
}
