// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Connection state and manual network lifecycle. */
export interface ConnectionApi {
  getConnectionState(): Promise<ConnectionState>;
  disconnect(): Promise<void>;
  notifyNetworkChange(request: NetworkChangeRequest): Promise<NetworkChangeResponse>;
}
