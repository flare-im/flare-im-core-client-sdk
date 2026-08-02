/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `events` — Typed SDK event stream.
 */
import type { EventCallback, EventSubscription, FlareImEventListener } from '../../listener';
import type { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';
import type { SubscribeEventsRequest, Subscription, UnsubscribeRequest } from '../types';

/** Typed SDK event stream. */
export interface EventsApi {
  /** subscribeEvents maps to `flare_event_subscribe` via `ffi-symbol`. Operation: `event.subscribe`. */
  subscribeEvents(request: SubscribeEventsRequest): Promise<Subscription>;
  /** subscribeEventsBatch maps to `flare_event_subscribe_batch` via `ffi-symbol`. Operation: `event.subscribe_batch`. */
  subscribeEventsBatch(request: SubscribeEventsRequest): Promise<Subscription>;
  /** unsubscribe maps to `flare_event_unsubscribe` via `ffi-symbol`. Operation: `event.unsubscribe`. */
  unsubscribe(request: UnsubscribeRequest): Promise<void>;
  /** unsubscribeAll maps to `flare_event_unsubscribe_all` via `ffi-symbol`. Operation: `event.unsubscribe_all`. */
  unsubscribeAll(): Promise<void>;
  /** Registers a listener object for typed SDK runtime notifications. */
  addEventListener(listener: FlareImEventListener): EventSubscription;
  /** Removes one local listener registration. */
  removeEventListener(subscription: EventSubscription): void;
  /** SDK initialization has started. */
  onInitializing(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** SDK initialization completed successfully. */
  onInitialized(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** SDK initialization failed. */
  onInitFailed(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** SDK login completed successfully. */
  onLoginSucceeded(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** SDK login failed. */
  onLoginFailed(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** The current SDK session logged out. */
  onLoggedOut(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** The SDK client has been disposed. */
  onDisposed(listener: EventCallback<LifecycleEvent>): EventSubscription;
  /** SDK is connecting to the IM server. */
  onConnecting(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** SDK connected to the IM server successfully. */
  onConnectSuccess(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** SDK connection is authenticated and ready for message traffic. */
  onConnectReady(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** SDK failed to connect to the IM server. */
  onConnectFailed(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** SDK disconnected from the IM server. */
  onDisconnected(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** SDK is attempting to reconnect to the IM server. */
  onReconnecting(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** SDK reconnect attempt failed. */
  onReconnectFailed(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** The account logged in elsewhere and this device was kicked offline. */
  onKickedOffline(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** The login token expired and the app should renew credentials. */
  onUserTokenExpired(listener: EventCallback<ConnectionEvent>): EventSubscription;
  /** A single message was received. */
  onMessageReceived(listener: EventCallback<MessageReceivedEvent>): EventSubscription;
  /** A batch of messages was received. */
  onMessageReceivedBatch(listener: EventCallback<MessageReceivedBatchEvent>): EventSubscription;
  /** A message send operation was acknowledged. */
  onMessageSendAck(listener: EventCallback<MessageSendAckEvent>): EventSubscription;
  /** A message send operation failed. */
  onMessageSendFailed(listener: EventCallback<MessageSendFailedEvent>): EventSubscription;
  /** A message was recalled. */
  onMessageRecalled(listener: EventCallback<MessageMutationEvent>): EventSubscription;
  /** A message was edited. */
  onMessageEdited(listener: EventCallback<MessageMutationEvent>): EventSubscription;
  /** A message was deleted. */
  onMessageDeleted(listener: EventCallback<MessageMutationEvent>): EventSubscription;
  /** A message read receipt changed. */
  onMessageReadReceipt(listener: EventCallback<ReadReceiptEvent>): EventSubscription;
  /** A message reaction changed. */
  onMessageReactionChanged(listener: EventCallback<ReactionChangedEvent>): EventSubscription;
  /** A conversation input or typing status changed. */
  onInputStatusChanged(listener: EventCallback<TypingEvent>): EventSubscription;
  /** Aggregated typing status changed for a large conversation. */
  onTypingAggregateChanged(listener: EventCallback<TypingAggregateEvent>): EventSubscription;
  /** A burn-after-read message was burned. */
  onMessageBurned(listener: EventCallback<MessageMutationEvent>): EventSubscription;
  /** A message was pinned. */
  onMessagePinned(listener: EventCallback<MessageMutationEvent>): EventSubscription;
  /** A message was unpinned. */
  onMessageUnpinned(listener: EventCallback<MessageMutationEvent>): EventSubscription;
  /** A core observable view snapshot changed. */
  onViewUpdated(listener: EventCallback<ViewUpdate>): EventSubscription;
  /** A new conversation was created or discovered. */
  onNewConversation(listener: EventCallback<ConversationEvent>): EventSubscription;
  /** Important conversation fields changed. */
  onConversationChanged(listener: EventCallback<ConversationEvent>): EventSubscription;
  /** The total unread message count changed. */
  onTotalUnreadMessageCountChanged(listener: EventCallback<ConversationEvent>): EventSubscription;
  /** A conversation was deleted. */
  onConversationDeleted(listener: EventCallback<ConversationEvent>): EventSubscription;
  /** Server conversation or message sync started. */
  onSyncServerStart(listener: EventCallback<SyncEvent>): EventSubscription;
  /** Server conversation or message sync finished. */
  onSyncServerFinish(listener: EventCallback<SyncEvent>): EventSubscription;
  /** Server conversation or message sync failed. */
  onSyncServerFailed(listener: EventCallback<SyncEvent>): EventSubscription;
  /** Server sync progress changed. */
  onSyncProgress(listener: EventCallback<ProgressEvent>): EventSubscription;
  /** Media upload progress changed. */
  onUploadProgress(listener: EventCallback<ProgressEvent>): EventSubscription;
  /** Media download progress changed. */
  onDownloadProgress(listener: EventCallback<ProgressEvent>): EventSubscription;
  /** A runtime capability or plugin availability changed. */
  onCapabilityChanged(listener: EventCallback<CapabilityEvent>): EventSubscription;
}
