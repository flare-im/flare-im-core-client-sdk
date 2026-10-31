// GENERATED. Do not edit by hand.
import 'conversation.dart';
import 'message.dart';

/// The window of a timeline view: rows in timeline order and where it stands.
final class TimelineViewSnapshot {
  /// wire: `conversation`. Conversation header.
  final Conversation? conversation;
  /// wire: `messages`. Rows in timeline order (oldest first); pending rows trail when the window is attached to the latest.
  final List<Message> messages;
  /// wire: `hasOlder`. More visible messages exist below the oldest row; answered by the proven seq ranges only.
  final bool hasOlder;
  /// wire: `hasNewer`. More messages exist above the newest row; true exactly when attachedToLatest is false.
  final bool hasNewer;
  /// wire: `attachedToLatest`. The newest row is the latest local message and live messages are appended.
  final bool attachedToLatest;
  /// wire: `anchorKey`. Row key of the target when the view was opened around a message.
  final String? anchorKey;

  const TimelineViewSnapshot({
    this.conversation,
    this.messages = const [],
    this.hasOlder = false,
    this.hasNewer = false,
    this.attachedToLatest = false,
    this.anchorKey,
  });
}
