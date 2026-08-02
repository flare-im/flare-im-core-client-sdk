// GENERATED. Do not edit by hand.

/// Request for opening an observable conversation timeline view.
final class OpenTimelineViewRequest {
  /// wire: `conversationId`. Conversation id to observe.
  final String conversationId;
  /// wire: `messageLimit`. Maximum messages to include in the initial snapshot.
  final int messageLimit;

  const OpenTimelineViewRequest({
    this.conversationId = '',
    this.messageLimit = 0,
  });
}
