// GENERATED. Do not edit by hand.
import 'conversation_event_name.dart';

/// Conversation notification payload.
final class ConversationEvent {
  /// wire: `name`. Conversation event name.
  final ConversationEventName name;
  /// wire: `conversationId`. Affected conversation id.
  final String? conversationId;
  /// wire: `conversationIds`. Affected conversation ids for sync events.
  final List<String> conversationIds;
  /// wire: `unreadCount`. Unread count for unread-count changes.
  final int? unreadCount;

  const ConversationEvent({
    required this.name,
    this.conversationId,
    this.conversationIds = const [],
    this.unreadCount,
  });
}
