// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Explicit sync operations. */
export interface SyncApi {
  syncConversationSummaries(): Promise<void>;
  syncConversationSummariesWithVersions(request: SyncConversationSummariesRequest): Promise<SyncConversationSummariesResponse>;
  bootstrapStartupHome(request: StartupHomeSyncRequest): Promise<StartupHomeSyncResponse>;
  backfillConversationHistory(request: ConversationHistoryBackfillRequest): Promise<ConversationHistoryBackfillResponse>;
  syncConversation(request: Record<string, Object>): Promise<void>;
  syncMessages(request: Record<string, Object>): Promise<void>;
}
