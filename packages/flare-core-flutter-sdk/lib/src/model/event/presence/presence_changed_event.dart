// GENERATED. Do not edit by hand.

/// Presence notification payload.
final class PresenceChangedEvent {
  /// wire: `conversationId`. Conversation id when presence is scoped to a conversation.
  final String? conversationId;
  /// wire: `userId`. User id.
  final String userId;
  /// wire: `status`. Presence status.
  final String status;
  /// wire: `extra`. Opaque presence details.
  final Map<String, String> extra;

  const PresenceChangedEvent({
    this.conversationId,
    this.userId = '',
    this.status = '',
    this.extra = const {},
  });
}
