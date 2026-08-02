package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Optional callback surface for apps that prefer one listener object.
public interface FlareImEventListener {
    // SDK initialization has started.
    func onInitializing(event: LifecycleEvent): Unit
    // SDK initialization completed successfully.
    func onInitialized(event: LifecycleEvent): Unit
    // SDK initialization failed.
    func onInitFailed(event: LifecycleEvent): Unit
    // SDK login completed successfully.
    func onLoginSucceeded(event: LifecycleEvent): Unit
    // SDK login failed.
    func onLoginFailed(event: LifecycleEvent): Unit
    // The current SDK session logged out.
    func onLoggedOut(event: LifecycleEvent): Unit
    // The SDK client has been disposed.
    func onDisposed(event: LifecycleEvent): Unit
    // SDK is connecting to the IM server.
    func onConnecting(event: ConnectionEvent): Unit
    // SDK connected to the IM server successfully.
    func onConnectSuccess(event: ConnectionEvent): Unit
    // SDK connection is authenticated and ready for message traffic.
    func onConnectReady(event: ConnectionEvent): Unit
    // SDK failed to connect to the IM server.
    func onConnectFailed(event: ConnectionEvent): Unit
    // SDK disconnected from the IM server.
    func onDisconnected(event: ConnectionEvent): Unit
    // SDK is attempting to reconnect to the IM server.
    func onReconnecting(event: ConnectionEvent): Unit
    // SDK reconnect attempt failed.
    func onReconnectFailed(event: ConnectionEvent): Unit
    // The account logged in elsewhere and this device was kicked offline.
    func onKickedOffline(event: ConnectionEvent): Unit
    // The login token expired and the app should renew credentials.
    func onUserTokenExpired(event: ConnectionEvent): Unit
    // A single message was received.
    func onMessageReceived(event: MessageReceivedEvent): Unit
    // A batch of messages was received.
    func onMessageReceivedBatch(event: MessageReceivedBatchEvent): Unit
    // A message send operation was acknowledged.
    func onMessageSendAck(event: MessageSendAckEvent): Unit
    // A message send operation failed.
    func onMessageSendFailed(event: MessageSendFailedEvent): Unit
    // A message was recalled.
    func onMessageRecalled(event: MessageMutationEvent): Unit
    // A message was edited.
    func onMessageEdited(event: MessageMutationEvent): Unit
    // A message was deleted.
    func onMessageDeleted(event: MessageMutationEvent): Unit
    // A message read receipt changed.
    func onMessageReadReceipt(event: ReadReceiptEvent): Unit
    // A message reaction changed.
    func onMessageReactionChanged(event: ReactionChangedEvent): Unit
    // A conversation input or typing status changed.
    func onInputStatusChanged(event: TypingEvent): Unit
    // Aggregated typing status changed for a large conversation.
    func onTypingAggregateChanged(event: TypingAggregateEvent): Unit
    // A burn-after-read message was burned.
    func onMessageBurned(event: MessageMutationEvent): Unit
    // A message was pinned.
    func onMessagePinned(event: MessageMutationEvent): Unit
    // A message was unpinned.
    func onMessageUnpinned(event: MessageMutationEvent): Unit
    // A core observable view snapshot changed.
    func onViewUpdated(event: ViewUpdate): Unit
    // A new conversation was created or discovered.
    func onNewConversation(event: ConversationEvent): Unit
    // Important conversation fields changed.
    func onConversationChanged(event: ConversationEvent): Unit
    // The total unread message count changed.
    func onTotalUnreadMessageCountChanged(event: ConversationEvent): Unit
    // A conversation was deleted.
    func onConversationDeleted(event: ConversationEvent): Unit
    // Server conversation or message sync started.
    func onSyncServerStart(event: SyncEvent): Unit
    // Server conversation or message sync finished.
    func onSyncServerFinish(event: SyncEvent): Unit
    // Server conversation or message sync failed.
    func onSyncServerFailed(event: SyncEvent): Unit
    // Server sync progress changed.
    func onSyncProgress(event: ProgressEvent): Unit
    // Media upload progress changed.
    func onUploadProgress(event: ProgressEvent): Unit
    // Media download progress changed.
    func onDownloadProgress(event: ProgressEvent): Unit
    // A runtime capability or plugin availability changed.
    func onCapabilityChanged(event: CapabilityEvent): Unit
}
