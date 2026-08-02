// GENERATED. Do not edit by hand.
// Module API: `events` — Typed SDK event stream.
import '../../model/model.dart';
import '../../listener/listener.dart';

/// Typed SDK event stream.
abstract interface class EventsApi {
  /// subscribeEvents maps to `flare_event_subscribe` via `ffi-symbol`. Operation: `event.subscribe`.
  Future<Map<String, Object?>> subscribeEvents(Map<String, Object?> request);
  /// subscribeEventsBatch maps to `flare_event_subscribe_batch` via `ffi-symbol`. Operation: `event.subscribe_batch`.
  Future<Map<String, Object?>> subscribeEventsBatch(Map<String, Object?> request);
  /// unsubscribe maps to `flare_event_unsubscribe` via `ffi-symbol`. Operation: `event.unsubscribe`.
  Future<void> unsubscribe(Map<String, Object?> request);
  /// unsubscribeAll maps to `flare_event_unsubscribe_all` via `ffi-symbol`. Operation: `event.unsubscribe_all`.
  Future<void> unsubscribeAll();
  /// Registers a listener object for typed SDK runtime notifications.
  EventSubscription addEventListener(FlareImEventListener listener);
  /// Removes one local listener registration.
  void removeEventListener(EventSubscription subscription);
  /// SDK initialization has started.
  EventSubscription onInitializing(EventCallback<LifecycleEvent> listener);
  /// SDK initialization completed successfully.
  EventSubscription onInitialized(EventCallback<LifecycleEvent> listener);
  /// SDK initialization failed.
  EventSubscription onInitFailed(EventCallback<LifecycleEvent> listener);
  /// SDK login completed successfully.
  EventSubscription onLoginSucceeded(EventCallback<LifecycleEvent> listener);
  /// SDK login failed.
  EventSubscription onLoginFailed(EventCallback<LifecycleEvent> listener);
  /// The current SDK session logged out.
  EventSubscription onLoggedOut(EventCallback<LifecycleEvent> listener);
  /// The SDK client has been disposed.
  EventSubscription onDisposed(EventCallback<LifecycleEvent> listener);
  /// SDK is connecting to the IM server.
  EventSubscription onConnecting(EventCallback<ConnectionEvent> listener);
  /// SDK connected to the IM server successfully.
  EventSubscription onConnectSuccess(EventCallback<ConnectionEvent> listener);
  /// SDK connection is authenticated and ready for message traffic.
  EventSubscription onConnectReady(EventCallback<ConnectionEvent> listener);
  /// SDK failed to connect to the IM server.
  EventSubscription onConnectFailed(EventCallback<ConnectionEvent> listener);
  /// SDK disconnected from the IM server.
  EventSubscription onDisconnected(EventCallback<ConnectionEvent> listener);
  /// SDK is attempting to reconnect to the IM server.
  EventSubscription onReconnecting(EventCallback<ConnectionEvent> listener);
  /// SDK reconnect attempt failed.
  EventSubscription onReconnectFailed(EventCallback<ConnectionEvent> listener);
  /// The account logged in elsewhere and this device was kicked offline.
  EventSubscription onKickedOffline(EventCallback<ConnectionEvent> listener);
  /// The login token expired and the app should renew credentials.
  EventSubscription onUserTokenExpired(EventCallback<ConnectionEvent> listener);
  /// A single message was received.
  EventSubscription onMessageReceived(EventCallback<MessageReceivedEvent> listener);
  /// A batch of messages was received.
  EventSubscription onMessageReceivedBatch(EventCallback<MessageReceivedBatchEvent> listener);
  /// A message send operation was acknowledged.
  EventSubscription onMessageSendAck(EventCallback<MessageSendAckEvent> listener);
  /// A message send operation failed.
  EventSubscription onMessageSendFailed(EventCallback<MessageSendFailedEvent> listener);
  /// A message was recalled.
  EventSubscription onMessageRecalled(EventCallback<MessageMutationEvent> listener);
  /// A message was edited.
  EventSubscription onMessageEdited(EventCallback<MessageMutationEvent> listener);
  /// A message was deleted.
  EventSubscription onMessageDeleted(EventCallback<MessageMutationEvent> listener);
  /// A message read receipt changed.
  EventSubscription onMessageReadReceipt(EventCallback<ReadReceiptEvent> listener);
  /// A message reaction changed.
  EventSubscription onMessageReactionChanged(EventCallback<ReactionChangedEvent> listener);
  /// A conversation input or typing status changed.
  EventSubscription onInputStatusChanged(EventCallback<TypingEvent> listener);
  /// Aggregated typing status changed for a large conversation.
  EventSubscription onTypingAggregateChanged(EventCallback<TypingAggregateEvent> listener);
  /// A burn-after-read message was burned.
  EventSubscription onMessageBurned(EventCallback<MessageMutationEvent> listener);
  /// A message was pinned.
  EventSubscription onMessagePinned(EventCallback<MessageMutationEvent> listener);
  /// A message was unpinned.
  EventSubscription onMessageUnpinned(EventCallback<MessageMutationEvent> listener);
  /// A core observable view snapshot changed.
  EventSubscription onViewUpdated(EventCallback<ViewUpdate> listener);
  /// A new conversation was created or discovered.
  EventSubscription onNewConversation(EventCallback<ConversationEvent> listener);
  /// Important conversation fields changed.
  EventSubscription onConversationChanged(EventCallback<ConversationEvent> listener);
  /// The total unread message count changed.
  EventSubscription onTotalUnreadMessageCountChanged(EventCallback<ConversationEvent> listener);
  /// A conversation was deleted.
  EventSubscription onConversationDeleted(EventCallback<ConversationEvent> listener);
  /// Server conversation or message sync started.
  EventSubscription onSyncServerStart(EventCallback<SyncEvent> listener);
  /// Server conversation or message sync finished.
  EventSubscription onSyncServerFinish(EventCallback<SyncEvent> listener);
  /// Server conversation or message sync failed.
  EventSubscription onSyncServerFailed(EventCallback<SyncEvent> listener);
  /// Server sync progress changed.
  EventSubscription onSyncProgress(EventCallback<ProgressEvent> listener);
  /// Media upload progress changed.
  EventSubscription onUploadProgress(EventCallback<ProgressEvent> listener);
  /// Media download progress changed.
  EventSubscription onDownloadProgress(EventCallback<ProgressEvent> listener);
  /// A runtime capability or plugin availability changed.
  EventSubscription onCapabilityChanged(EventCallback<CapabilityEvent> listener);
}
