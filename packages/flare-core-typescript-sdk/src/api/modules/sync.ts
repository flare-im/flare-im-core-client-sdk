/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `sync` — Explicit sync operations.
 */
import type { ConversationHistoryBackfillRequest, ConversationHistoryBackfillResponse, StartupHomeSyncRequest, StartupHomeSyncResponse, SyncConversationSummariesRequest, SyncConversationSummariesResponse } from '../../model';
import type { SyncConversationRequest, SyncMessagesRequest } from '../types';

/** Explicit sync operations. */
export interface SyncApi {
  /** syncConversationSummaries maps to `flare_sdk_invoke_json`. Operation: `sync.conversation_summaries`. */
  syncConversationSummaries(): Promise<void>;
  /** syncConversationSummariesWithVersions maps to `flare_sdk_invoke_json`. Operation: `sync.conversation_summaries_with_versions`. */
  syncConversationSummariesWithVersions(request: SyncConversationSummariesRequest): Promise<SyncConversationSummariesResponse>;
  /** bootstrapStartupHome maps to `flare_sdk_invoke_json`. Operation: `sync.bootstrap_startup_home`. */
  bootstrapStartupHome(request: StartupHomeSyncRequest): Promise<StartupHomeSyncResponse>;
  /** backfillConversationHistory maps to `flare_sdk_invoke_json`. Operation: `sync.conversation_history_backfill`. */
  backfillConversationHistory(request: ConversationHistoryBackfillRequest): Promise<ConversationHistoryBackfillResponse>;
  /** syncConversation maps to `flare_sdk_sync_conversation` via `ffi-symbol`. Operation: `sync.conversation`. */
  syncConversation(request: SyncConversationRequest): Promise<void>;
  /** syncMessages maps to `flare_sdk_sync_messages` via `ffi-symbol`. Operation: `sync.messages`. */
  syncMessages(request: SyncMessagesRequest): Promise<void>;
}
