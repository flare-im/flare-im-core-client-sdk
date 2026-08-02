// GENERATED. Do not edit by hand.

/// Build a text message.
final class BuildTextMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `text`. Text body.
  final String text;
  /// wire: `mentionUsers`. User ids mentioned in the text body. The core builder resolves @userId spans into typed mentions.
  final List<String>? mentionUsers;
  /// wire: `mentionAll`. Whether the message mentions every member in the target conversation.
  final bool? mentionAll;

  const BuildTextMessageRequest({
    this.conversationId = '',
    this.text = '',
    this.mentionUsers,
    this.mentionAll,
  });
}
