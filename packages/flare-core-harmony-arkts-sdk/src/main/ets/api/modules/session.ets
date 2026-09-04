// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** SDK lifecycle, authenticated session and process-level utilities. */
export interface SessionApi {
  create(request: Record<string, Object>): Promise<Record<string, Object>>;
  init(request: Record<string, Object>): Promise<void>;
  uninit(): Promise<void>;
  login(request: Record<string, Object>): Promise<void>;
  prepare(request: Record<string, Object>): Promise<void>;
  connect(request: Record<string, Object>): Promise<void>;
  updateAccessToken(request: Record<string, Object>): Promise<void>;
  setHeartbeatAppState(request: SetHeartbeatAppStateRequest): Promise<void>;
  setHeartbeatNatTimeout(request: SetHeartbeatNatTimeoutRequest): Promise<void>;
  heartbeatEffectiveInterval(): Promise<HeartbeatEffectiveIntervalResponse>;
  logout(): Promise<void>;
  dispose(): Promise<void>;
  hardReset(): Promise<void>;
  currentUserId(): Promise<Record<string, Object>>;
  isConnected(): Promise<boolean>;
  sessionActive(): Promise<boolean>;
}
