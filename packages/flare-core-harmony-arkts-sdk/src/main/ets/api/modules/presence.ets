// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Presence and input state. */
export interface PresenceApi {
  getUserPresence(request: Record<string, Object>): Promise<Record<string, Object>>;
  batchGetUserPresence(request: Record<string, Object>): Promise<Record<string, Object>>;
  subscribeUserPresence(request: Record<string, Object>): Promise<void>;
}
