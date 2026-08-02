// GENERATED. Do not edit by hand.

/// Message reaction changed notification.
final class ReactionChangedEvent {
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `serverMsgId`. Server message id.
  final String serverMsgId;
  /// wire: `userId`. User who changed the reaction.
  final String userId;
  /// wire: `emoji`. Reaction emoji.
  final String emoji;
  /// wire: `action`. Reaction action integer from core.
  final int action;

  const ReactionChangedEvent({
    this.conversationId = '',
    this.serverMsgId = '',
    this.userId = '',
    this.emoji = '',
    this.action = 0,
  });
}
