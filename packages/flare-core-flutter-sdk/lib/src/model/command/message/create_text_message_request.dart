// GENERATED. Do not edit by hand.

/// Create a text message draft for a conversation.
final class CreateTextMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `text`. Text body.
  final String text;

  const CreateTextMessageRequest({
    this.conversationId = '',
    this.text = '',
  });
}
