// GENERATED. Do not edit by hand.
import '../entity/timeline_anchor.dart';

/// Request for opening an observable conversation timeline view.
final class OpenTimelineViewRequest {
  /// wire: `conversationId`. Conversation id to observe.
  final String conversationId;
  /// wire: `messageLimit`. Page size: rows in the initial window and in each older or newer page when a paging request does not give its own (core default 40, at most 100).
  final int messageLimit;
  /// wire: `anchor`. Open around this message instead of at the latest messages; the window holds half a page on each side of it.
  final TimelineAnchor? anchor;

  const OpenTimelineViewRequest({
    this.conversationId = '',
    this.messageLimit = 0,
    this.anchor,
  });
}
