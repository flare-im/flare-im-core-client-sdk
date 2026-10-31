// GENERATED. Do not edit by hand.
import 'conversation.dart';
import 'timeline_sync_state.dart';

/// HomeTimelineSnapshot
final class HomeTimelineSnapshot {
  /// wire: `conversations`. 
  final List<Conversation> conversations;
  /// wire: `syncState`. 
  final TimelineSyncState syncState;
  /// wire: `totalUnread`. Unread total across all conversations, not only the returned ones (the rule of `conversation.total_unread`).
  final int totalUnread;

  const HomeTimelineSnapshot({
    this.conversations = const [],
    required this.syncState,
    this.totalUnread = 0,
  });
}
