// GENERATED. Do not edit by hand.

/// Aggregated typing/input-state notification for large conversations.
final class TypingAggregateEvent {
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `typingUserIds`. Users currently typing in the aggregation window.
  final List<String> typingUserIds;
  /// wire: `typingCount`. Number of users currently typing in the aggregation window.
  final int typingCount;

  const TypingAggregateEvent({
    this.conversationId = '',
    this.typingUserIds = const [],
    this.typingCount = 0,
  });
}
