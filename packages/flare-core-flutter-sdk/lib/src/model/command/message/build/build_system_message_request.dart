// GENERATED. Do not edit by hand.

/// Build a system message.
final class BuildSystemMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `eventKind`. System event kind.
  final String eventKind;
  /// wire: `body`. System event body.
  final String body;

  const BuildSystemMessageRequest({
    this.conversationId = '',
    this.eventKind = '',
    this.body = '',
  });
}
