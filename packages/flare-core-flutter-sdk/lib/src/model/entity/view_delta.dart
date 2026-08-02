// GENERATED. Do not edit by hand.
import 'conversation.dart';
import 'view_delta_op.dart';

/// Typed delta emitted by core observable views.
final class ViewDelta {
  /// wire: `viewType`. Delta tag: timeline or conversationList.
  final String viewType;
  /// wire: `ops`. Ordered delta operations.
  final List<ViewDeltaOp> ops;
  /// wire: `conversation`. Latest timeline conversation header for timeline deltas.
  final Conversation? conversation;
  /// wire: `hasMore`. Latest timeline pagination state for timeline deltas.
  final bool? hasMore;
  /// wire: `totalUnread`. Latest total unread value for conversation list deltas.
  final int? totalUnread;
  /// wire: `syncState`. Latest sync state for conversation list deltas.
  final String? syncState;

  const ViewDelta({
    this.viewType = '',
    this.ops = const [],
    this.conversation,
    this.hasMore,
    this.totalUnread,
    this.syncState,
  });
}
