// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** SDK version and FFI contract diagnostics. */
export interface DiagnosticsApi {
  getSdkVersion(): Promise<Record<string, Object>>;
  getFfiContractVersion(): Promise<Record<string, Object>>;
  getDataRoot(): Promise<Record<string, Object>>;
  getRuntimeHealth(): Promise<RuntimeHealthResponse>;
}
