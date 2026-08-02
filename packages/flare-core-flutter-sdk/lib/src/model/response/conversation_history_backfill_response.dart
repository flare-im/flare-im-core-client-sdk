// GENERATED. Do not edit by hand.

/// Result of direct local-store historical backfill for one conversation.
final class ConversationHistoryBackfillResponse {
  /// wire: `conversationId`. Stable conversation id.
  final String conversationId;
  /// wire: `pagesLoaded`. Number of older pages that advanced the local oldest seq.
  final int pagesLoaded;
  /// wire: `oldestSeqBefore`. Oldest local conversation seq before backfill.
  final int oldestSeqBefore;
  /// wire: `oldestSeqAfter`. Oldest local conversation seq after backfill.
  final int oldestSeqAfter;
  /// wire: `hasMore`. Whether the server reported more history remains.
  final bool hasMore;
  /// wire: `completed`. True when this call reached the earliest visible history or the server reported no more pages.
  final bool completed;

  const ConversationHistoryBackfillResponse({
    this.conversationId = '',
    this.pagesLoaded = 0,
    this.oldestSeqBefore = 0,
    this.oldestSeqAfter = 0,
    this.hasMore = false,
    this.completed = false,
  });
}
