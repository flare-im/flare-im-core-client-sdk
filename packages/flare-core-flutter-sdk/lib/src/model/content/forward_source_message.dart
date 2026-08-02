// GENERATED. Do not edit by hand.

/// One source message inside a forward bundle.
final class ForwardSourceMessage {
  /// wire: `sourceMessageId`. Original message id.
  final String sourceMessageId;
  /// wire: `sourceConversationId`. Original conversation id.
  final String? sourceConversationId;
  /// wire: `sourceSenderId`. Original sender id.
  final String? sourceSenderId;
  /// wire: `plainText`. Preview text.
  final String? plainText;

  const ForwardSourceMessage({
    this.sourceMessageId = '',
    this.sourceConversationId,
    this.sourceSenderId,
    this.plainText,
  });
}
