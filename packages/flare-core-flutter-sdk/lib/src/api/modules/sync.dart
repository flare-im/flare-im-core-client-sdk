// GENERATED. Do not edit by hand.
// Module API: `sync` — Explicit sync operations.
import '../../model/model.dart';

/// Explicit sync operations.
abstract interface class SyncApi {
  /// syncConversationSummaries maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sync.conversation_summaries`.
  Future<void> syncConversationSummaries();
  /// syncConversationSummariesWithVersions maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sync.conversation_summaries_with_versions`.
  Future<SyncConversationSummariesResponse> syncConversationSummariesWithVersions(SyncConversationSummariesRequest request);
  /// bootstrapStartupHome maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sync.bootstrap_startup_home`.
  Future<StartupHomeSyncResponse> bootstrapStartupHome(StartupHomeSyncRequest request);
  /// backfillConversationHistory maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sync.conversation_history_backfill`.
  Future<ConversationHistoryBackfillResponse> backfillConversationHistory(ConversationHistoryBackfillRequest request);
  /// syncConversation maps to `flare_sdk_sync_conversation` via `ffi-symbol`. Operation: `sync.conversation`.
  Future<void> syncConversation(Map<String, Object?> request);
  /// syncMessages maps to `flare_sdk_sync_messages` via `ffi-symbol`. Operation: `sync.messages`.
  Future<void> syncMessages(Map<String, Object?> request);
}
