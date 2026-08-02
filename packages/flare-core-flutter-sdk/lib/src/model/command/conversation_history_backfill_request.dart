// GENERATED. Do not edit by hand.

/// Request to backfill one conversation's historical messages into the local store.
final class ConversationHistoryBackfillRequest {
  /// wire: `conversationId`. Stable conversation id.
  final String conversationId;
  /// wire: `limit`. Maximum messages per backfill page.
  final int? limit;
  /// wire: `maxPages`. Maximum historical pages to request for this call.
  final int? maxPages;

  const ConversationHistoryBackfillRequest({
    this.conversationId = '',
    this.limit,
    this.maxPages,
  });
}
