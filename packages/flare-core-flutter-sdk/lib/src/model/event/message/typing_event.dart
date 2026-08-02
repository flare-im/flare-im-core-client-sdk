// GENERATED. Do not edit by hand.

/// Typing/input-state notification.
final class TypingEvent {
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `userId`. Typing user id.
  final String userId;
  /// wire: `typing`. Whether user is typing.
  final bool typing;

  const TypingEvent({
    this.conversationId = '',
    this.userId = '',
    this.typing = false,
  });
}
