// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Capability discovery and optional plugin dispatch through capability dispatch ops. */
export interface CapabilitiesApi {
  listCapabilities(request: Record<string, Object>): Promise<Record<string, Object>>;
  listUserCapabilities(request: Record<string, Object>): Promise<Record<string, Object>>;
  dispatchCapability(request: Record<string, Object>): Promise<Record<string, Object>>;
  grantCapability(request: Record<string, Object>): Promise<void>;
  revokeCapability(request: Record<string, Object>): Promise<void>;
  sendCallSignal(request: Record<string, Object>): Promise<void>;
}
