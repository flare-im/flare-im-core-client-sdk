# Events

> Generated from split sdk-spec files

SDK events have two layers:

- `subscribeEvents` is the canonical bridge-level event stream.
- High-level `on*` listener methods are local adapter registrations generated for every platform SDK.

Method return values remain the primary success/failure contract for commands such as `init`, `login`, and `sendMessage`. Events are used for runtime notifications, UI state, diagnostics, and async progress.

## Listener Methods

| Method | Domain | Event name | Payload | Description |
|--------|--------|------------|---------|-------------|
| `onInitializing` | `lifecycle` | `initializing` | `LifecycleEvent` | SDK initialization has started. |
| `onInitialized` | `lifecycle` | `initialized` | `LifecycleEvent` | SDK initialization completed successfully. |
| `onInitFailed` | `lifecycle` | `init_failed` | `LifecycleEvent` | SDK initialization failed. |
| `onLoginSucceeded` | `lifecycle` | `login_succeeded` | `LifecycleEvent` | SDK login completed successfully. |
| `onLoginFailed` | `lifecycle` | `login_failed` | `LifecycleEvent` | SDK login failed. |
| `onLoggedOut` | `lifecycle` | `logged_out` | `LifecycleEvent` | The current SDK session logged out. |
| `onDisposed` | `lifecycle` | `disposed` | `LifecycleEvent` | The SDK client has been disposed. |
| `onConnecting` | `connection` | `connecting` | `ConnectionEvent` | SDK is connecting to the IM server. |
| `onConnectSuccess` | `connection` | `connected` | `ConnectionEvent` | SDK connected to the IM server successfully. |
| `onConnectReady` | `connection` | `ready` | `ConnectionEvent` | SDK connection is authenticated and ready for message traffic. |
| `onConnectFailed` | `connection` | `server_error` | `ConnectionEvent` | SDK failed to connect to the IM server. |
| `onDisconnected` | `connection` | `disconnected` | `ConnectionEvent` | SDK disconnected from the IM server. |
| `onReconnecting` | `connection` | `reconnecting` | `ConnectionEvent` | SDK is attempting to reconnect to the IM server. |
| `onReconnectFailed` | `connection` | `reconnect_failed` | `ConnectionEvent` | SDK reconnect attempt failed. |
| `onKickedOffline` | `connection` | `kicked_off` | `ConnectionEvent` | The account logged in elsewhere and this device was kicked offline. |
| `onUserTokenExpired` | `connection` | `token_expired` | `ConnectionEvent` | The login token expired and the app should renew credentials. |
| `onMessageReceived` | `message` | `received` | `MessageReceivedEvent` | A single message was received. |
| `onMessageReceivedBatch` | `message` | `received_batch` | `MessageReceivedBatchEvent` | A batch of messages was received. |
| `onMessageSendAck` | `message` | `send_ack` | `MessageSendAckEvent` | A message send operation was acknowledged. |
| `onMessageSendFailed` | `message` | `send_failed` | `MessageSendFailedEvent` | A message send operation failed. |
| `onMessageRecalled` | `message` | `recalled` | `MessageMutationEvent` | A message was recalled. |
| `onMessageEdited` | `message` | `edited` | `MessageMutationEvent` | A message was edited. |
| `onMessageDeleted` | `message` | `deleted` | `MessageMutationEvent` | A message was deleted. |
| `onMessageReadReceipt` | `message` | `read_receipt` | `ReadReceiptEvent` | A message read receipt changed. |
| `onMessageReactionChanged` | `message` | `reaction_changed` | `ReactionChangedEvent` | A message reaction changed. |
| `onInputStatusChanged` | `message` | `typing` | `TypingEvent` | A conversation input or typing status changed. |
| `onTypingAggregateChanged` | `message` | `typing_aggregate` | `TypingAggregateEvent` | Aggregated typing status changed for a large conversation. |
| `onMessageBurned` | `message` | `burned` | `MessageMutationEvent` | A burn-after-read message was burned. |
| `onMessagePinned` | `message` | `pinned` | `MessageMutationEvent` | A message was pinned. |
| `onMessageUnpinned` | `message` | `unpinned` | `MessageMutationEvent` | A message was unpinned. |
| `onMessagePluginStateChanged` | `message` | `plugin_state_changed` | `MessageMutationEvent` | Plugin card state on a local message changed: the shared layer Core publishes for the card's entity (events, sync, the caller's own result) or the viewer's local layer. Re-present that message with its messageId; version is the local layer's when that changed, the shared layer's otherwise. |
| `onViewUpdated` | `view` | `updated` | `ViewUpdate` | A core observable view snapshot changed. |
| `onNewConversation` | `conversation` | `created` | `ConversationEvent` | A new conversation was created or discovered. |
| `onConversationChanged` | `conversation` | `updated` | `ConversationEvent` | Important conversation fields changed. |
| `onTotalUnreadMessageCountChanged` | `conversation` | `unread_count_changed` | `ConversationEvent` | The total unread message count changed. |
| `onConversationDeleted` | `conversation` | `deleted` | `ConversationEvent` | A conversation was deleted. |
| `onSyncServerStart` | `sync` | `started` | `SyncEvent` | Server conversation or message sync started. |
| `onSyncServerFinish` | `sync` | `finished` | `SyncEvent` | Server conversation or message sync finished. |
| `onSyncServerFailed` | `sync` | `failed` | `SyncEvent` | Server conversation or message sync failed. |
| `onSyncProgress` | `sync` | `progress` | `ProgressEvent` | Server sync progress changed. |
| `onUploadProgress` | `media` | `upload_progress` | `ProgressEvent` | Media upload progress changed. |
| `onDownloadProgress` | `media` | `download_progress` | `ProgressEvent` | Media download progress changed. |
| `onPluginRealtime` | `plugin` | `realtime` | `PluginRealtimeEvent` | A plugin delivered a realtime packet to this user's online connections (im.realtime.deliver): online only, at most once, never stored. Expired packets and payloads that are not JSON objects never arrive. Route by pluginId and packetType. |
| `onPluginCatalogChanged` | `plugin` | `catalog_changed` | `PluginCatalogChangedEvent` | The tenant's plugin catalog changed (a plugin enabled, disabled or reconfigured). The SDK has already invalidated its plugin catalog; read plugin entries and configuration again. Arrives a random 0-3 s after the notice, with the notices of 3 s merged into one. |

## Event Domains

| Domain | Names |
|--------|-------|
| `connection` | `connecting`, `reconnect_failed`, `ready`, `connected`, `disconnected`, `reconnecting`, `state_changed`, `sync_state_changed`, `server_error`, `kicked_off`, `token_expired` |
| `conversation` | `synced`, `created`, `updated`, `unread_count_changed`, `deleted` |
| `extension` | `event` |
| `lifecycle` | `initializing`, `initialized`, `init_failed`, `login_succeeded`, `login_failed`, `logged_out`, `disposed` |
| `media` | `cache_changed`, `upload_progress`, `download_progress` |
| `message` | `burn_scheduled`, `burned`, `hard_deleted`, `received`, `received_batch`, `send_ack`, `send_failed`, `recalled`, `typing`, `edited`, `reaction_changed`, `deleted`, `read_receipt`, `typing_aggregate`, `retention_scheduled`, `retention_expired`, `retention_purged`, `pinned`, `unpinned`, `marked`, `unmarked`, `presence_changed`, `custom`, `plugin_state_changed`, `read_summaries_changed` |
| `notification` | `received` |
| `plugin` | `realtime`, `catalog_changed` |
| `presence` | `changed` |
| `sync` | `started`, `finished`, `failed`, `progress`, `task_completed`, `state_changed`, `resync_needed`, `readiness` |
| `view` | `updated` |

Platform adapters should dispatch UI-facing callbacks on the platform's documented application/main context when required, while keeping native bridge callbacks non-blocking.
