// GENERATED. Do not edit by hand.
import { ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, PluginCatalogChangedEvent, PluginRealtimeEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Connection state and manual network lifecycle. */
export interface ConnectionApi {
  getConnectionState(): Promise<ConnectionState>;
  disconnect(): Promise<void>;
  getServerClock(): Promise<ServerClockResponse>;
  notifyNetworkChange(request: NetworkChangeRequest): Promise<NetworkChangeResponse>;
}
