// GENERATED. Do not edit by hand.
import 'message_event_name.dart';

/// Message mutation notification for recall, edit, delete, pin, mark and burn events.
final class MessageMutationEvent {
  /// wire: `name`. Mutation event name.
  final MessageEventName name;
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `messageId`. Client or server message id.
  final String? messageId;
  /// wire: `serverMsgId`. Server message id.
  final String? serverMsgId;
  /// wire: `userId`. User associated with the mutation.
  final String? userId;
  /// wire: `reason`. Mutation reason when available.
  final String? reason;

  const MessageMutationEvent({
    required this.name,
    this.conversationId = '',
    this.messageId,
    this.serverMsgId,
    this.userId,
    this.reason,
  });
}
