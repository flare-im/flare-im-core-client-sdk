// GENERATED. Do not edit by hand.

/// Build a thread reply message.
final class BuildThreadReplyMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `threadId`. Thread root message id.
  final String threadId;
  /// wire: `text`. Reply text.
  final String text;

  const BuildThreadReplyMessageRequest({
    this.conversationId = '',
    this.threadId = '',
    this.text = '',
  });
}
