// GENERATED. Do not edit by hand.

/// Page messages before a sequence in a conversation.
final class ListMessagesRequest {
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `beforeSeq`. Fetch messages before this sequence; 0 means latest page.
  final int beforeSeq;
  /// wire: `limit`. Page size.
  final int limit;

  const ListMessagesRequest({
    this.conversationId = '',
    this.beforeSeq = 0,
    this.limit = 0,
  });
}
