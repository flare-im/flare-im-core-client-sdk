// GENERATED. Do not edit by hand.

/// Core-owned startup sync policy shared by all platform SDKs.
final class StartupHomeSyncRequest {
  /// wire: `backfillVisibleHistories`. 
  final bool backfillVisibleHistories;
  /// wire: `conversationLimit`. 
  final int conversationLimit;
  /// wire: `historyBackfillLimit`. 
  final int historyBackfillLimit;
  /// wire: `historyBackfillMaxConversations`. 
  final int historyBackfillMaxConversations;
  /// wire: `historyBackfillMaxPagesPerConversation`. 
  final int historyBackfillMaxPagesPerConversation;
  /// wire: `startBackgroundConvergence`. 
  final bool startBackgroundConvergence;

  const StartupHomeSyncRequest({
    this.backfillVisibleHistories = false,
    this.conversationLimit = 0,
    this.historyBackfillLimit = 0,
    this.historyBackfillMaxConversations = 0,
    this.historyBackfillMaxPagesPerConversation = 0,
    this.startBackgroundConvergence = false,
  });
}
