// GENERATED. Do not edit by hand.
import 'conversation.dart';
import 'message.dart';

/// ConversationTimelineSnapshot
final class ConversationTimelineSnapshot {
  /// wire: `conversation`. 
  final Conversation? conversation;
  /// wire: `hasMore`. 
  final bool hasMore;
  /// wire: `messages`. 
  final List<Message> messages;

  const ConversationTimelineSnapshot({
    this.conversation,
    this.hasMore = false,
    this.messages = const [],
  });
}
