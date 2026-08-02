# Client Model Reference

> Generated from split sdk-spec files

Models are generated from `sdk-spec/models/*.json` and mirror stable message/conversation fields from `flare-im-core-sdk`.
Field names shown here are SDK-facing lowerCamelCase names; `wireName` records the current core JSON field.

## Conversations

Core-owned conversation DTOs derived from Rust JsonSchema.

### Enums

- `ConversationType`: ConversationType Values: `unspecified`, `single`, `group`, `ai`, `system`, `customer`, `temp`, `channel`, `broadcast`

- `TimelineSyncState`: TimelineSyncState Values: `localReady`, `synced`, `partial`

### ConversationParticipant

SDK 本地会话参与者快照。单聊不依赖该结构；群聊/频道/客服等非单聊用它支撑群通话、成员面板和后续设置页。

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `attributes` | `attributes` | `StringMap` | yes |  |
| `joinedAt` | `joinedAt` | `UInt64` | yes |  |
| `muted` | `muted` | `Boolean` | yes |  |
| `nickname` | `nickname` | `String` | yes |  |
| `pinned` | `pinned` | `Boolean` | yes |  |
| `roles` | `roles` | `StringList` | yes |  |
| `userId` | `userId` | `String` | yes |  |

### MessagePreview

MessagePreview

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `messageId` | `messageId` | `String` | yes |  |
| `senderId` | `senderId` | `String` | yes |  |
| `text` | `text` | `String` | yes |  |
| `time` | `time` | `UInt64` | yes | 毫秒时间戳 |
| `type` | `type` | `Int32` | yes |  |

### Conversation

SDK 层会话类型：内部统一使用，从 proto ConversationSummary 获取后即转换为此类型。 与 message.rs 的 IMMessage 一致：扁平字段、serde camelCase。

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `avatarUrl` | `avatarUrl` | `String` | yes |  |
| `badge` | `badge` | `String` | no |  |
| `businessType` | `businessType` | `String` | yes |  |
| `channelId` | `channelId` | `String` | yes | 会话路由 ID：单聊为对方 user_id；群/频道为业务 channel（与 proto `channel_id` 一致） |
| `conversationId` | `conversationId` | `String` | yes |  |
| `conversationType` | `conversationType` | `ConversationType` | yes |  |
| `createdAt` | `createdAt` | `UInt64` | yes |  |
| `description` | `description` | `String` | no |  |
| `displayName` | `displayName` | `String` | yes | 展示名（列表主标题） |
| `draft` | `draft` | `String` | no |  |
| `ext` | `ext` | `StringMap` | yes | 扩展键值（与 proto ext 对应） |
| `isArchived` | `isArchived` | `Boolean` | yes |  |
| `isMuted` | `isMuted` | `Boolean` | yes |  |
| `isPinned` | `isPinned` | `Boolean` | yes |  |
| `lastMessage` | `lastMessage` | `MessagePreview` | no |  |
| `lastMessageAt` | `lastMessageAt` | `UInt64` | no |  |
| `lastMessageId` | `lastMessageId` | `String` | no |  |
| `lastMessagePreview` | `lastMessagePreview` | `String` | no |  |
| `lastReadSeq` | `lastReadSeq` | `UInt64` | yes | 已读序列号（与 read_seq 同义） |
| `lastSenderAvatarUrl` | `lastSenderAvatarUrl` | `String` | yes | 最后一条消息发送者头像 URL |
| `lastSenderId` | `lastSenderId` | `String` | no |  |
| `lastSenderNickname` | `lastSenderNickname` | `String` | yes | 最后一条消息发送者展示名（列表用） |
| `maxSeq` | `maxSeq` | `UInt64` | yes |  |
| `memberPreview` | `memberPreview` | `ConversationParticipantList` | yes | 摘要级成员预览，最多少量成员，不能作为完整成员列表使用。 |
| `membersCount` | `membersCount` | `UInt32` | yes |  |
| `mentionCount` | `mentionCount` | `UInt32` | yes |  |
| `mentionMe` | `mentionMe` | `Boolean` | yes |  |
| `participantVersion` | `participantVersion` | `UInt64` | yes | 服务端成员读模型版本。完整成员通过独立 participants 同步拉取。 |
| `participants` | `participants` | `ConversationParticipantList` | yes | 已按需同步到本地的完整成员快照；会话摘要同步不会填充该字段。 |
| `peerReadSeq` | `peerReadSeq` | `UInt64` | yes | 对端（其他成员）最大已读序列号；用于发送方已读双勾在重连/重登后恢复。 由服务端同步摘要 `ext.peer_read_seq` 下发并持久化。 |
| `remark` | `remark` | `String` | no |  |
| `role` | `role` | `String` | no |  |
| `unreadCount` | `unreadCount` | `UInt32` | yes |  |
| `updatedAt` | `updatedAt` | `UInt64` | yes |  |
| `updatedAtTs` | `updatedAtTs` | `UInt64` | no | 更新时间戳（毫秒，用于排序/筛选） |
| `version` | `version` | `UInt64` | yes |  |
| `visibleAfterSeq` | `visibleAfterSeq` | `UInt64` | yes | 当前用户的历史可见边界；seq <= visible_after_seq 的消息不可见，不参与冷启动回灌。 |

### BootstrapHomeTimelineRequest

BootstrapHomeTimelineRequest

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationLimit` | `conversationLimit` | `UInt32` | yes |  |

### OpenConversationTimelineRequest

OpenConversationTimelineRequest

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes |  |
| `messageLimit` | `messageLimit` | `UInt32` | yes |  |

### HomeTimelineSnapshot

HomeTimelineSnapshot

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversations` | `conversations` | `ConversationList` | yes |  |
| `syncState` | `syncState` | `TimelineSyncState` | yes |  |
| `totalUnread` | `totalUnread` | `UInt64` | yes |  |

### ConversationTimelineSnapshot

ConversationTimelineSnapshot

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversation` | `conversation` | `Conversation` | no |  |
| `hasMore` | `hasMore` | `Boolean` | yes |  |
| `messages` | `messages` | `MessageList` | yes |  |

### ConversationListQuery

ConversationListQuery

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationTypes` | `conversationTypes` | `ConversationTypeList` | yes |  |
| `cursor` | `cursor` | `String` | no | cursor 为会话 ID，表示从该会话之后开始。 |
| `hasDraftOnly` | `hasDraftOnly` | `Boolean` | yes |  |
| `hasMarkedMessages` | `hasMarkedMessages` | `Boolean` | yes | 标记消息所在会话。core 当前没有“会话标签”模型，因此只支持消息标记聚合。 |
| `includeArchived` | `includeArchived` | `Boolean` | yes |  |
| `keyword` | `keyword` | `String` | no |  |
| `limit` | `limit` | `UInt32` | no |  |
| `mentionMeOnly` | `mentionMeOnly` | `Boolean` | yes |  |
| `mutedOnly` | `mutedOnly` | `Boolean` | no |  |
| `pinnedOnly` | `pinnedOnly` | `Boolean` | yes |  |
| `unreadOnly` | `unreadOnly` | `Boolean` | yes |  |

## Messages

Core-owned message DTOs derived from Rust JsonSchema.

### Enums

- `MessageSearchKind`: MessageSearchKind Values: `image`, `video`, `audio`, `message`, `text`, `media`, `file`

### ReactionEntry

ReactionEntry

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `count` | `count` | `UInt32` | yes |  |
| `emoji` | `emoji` | `String` | yes |  |
| `userIds` | `userIds` | `StringList` | yes |  |

### MessageLocalState

MessageLocalState

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `failed` | `failed` | `Boolean` | yes | 是否失败 |
| `isLocal` | `isLocal` | `Boolean` | yes | 本地消息 |
| `sending` | `sending` | `Boolean` | yes | 是否发送中 |
| `sortTs` | `sortTs` | `UInt64` | yes | 本地列表排序时间（毫秒），**不是**服务端会话 `conversation_seq`。 用途：待发/未 ACK 消息常保持 `conversation_seq == 0`，可用本字段稳定停留在本地时间线尾部。 已分配 `conversation_seq` 的服务端消息必须回到 seq 优先排序，避免设备时钟偏移污染权威顺序。 |
| `uploadProgress` | `uploadProgress` | `UInt32` | yes | 本地媒体上传进度，范围 0..=100。 |
| `uploading` | `uploading` | `Boolean` | yes | 本地媒体上传中；仅用于 SDK 本地时间线展示，不写入服务端协议语义。 |

### Message

SDK 层消息类型：与 message.proto 的 Message 属性一致，content 为解码后的 Elem； 另保留 raw_content 与 proto 一致用于持久化/网络，并增加发送者展示字段。

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `attributes` | `attributes` | `StringMap` | yes |  |
| `channelId` | `channelId` | `String` | yes | 会话频道 ID：单聊=对方 user_id，群聊=群 ID，频道/话题=对应 ID |
| `clientCreatedAt` | `clientCreatedAt` | `UInt64` | yes | 客户端本地创建时间，Unix epoch millis。 |
| `clientMsgId` | `clientMsgId` | `String` | yes | 客户端生成ID（去重） |
| `content` | `content` | `MessageContent` | no | proto结构 |
| `conversationId` | `conversationId` | `String` | yes | 会话ID |
| `conversationSeq` | `conversationSeq` | `UInt64` | yes | 会话内持久化 replay 序列号。 |
| `conversationType` | `conversationType` | `Int32` | yes | 会话类型 |
| `createdAt` | `createdAt` | `UInt64` | yes | 消息创建时间，Unix epoch millis。 |
| `extensions` | `extensions` | `BinaryMap` | yes | 扩展数据；未提供时为空。 |
| `isEdited` | `isEdited` | `Boolean` | yes |  |
| `isRead` | `isRead` | `Boolean` | yes |  |
| `isRecalled` | `isRecalled` | `Boolean` | yes |  |
| `localState` | `localState` | `MessageLocalState` | no |  |
| `mentionAll` | `mentionAll` | `Boolean` | yes |  |
| `mentionUsers` | `mentionUsers` | `StringList` | yes |  |
| `messageType` | `messageType` | `Int32` | yes | 消息类型 |
| `quotePreview` | `quotePreview` | `String` | no |  |
| `reactions` | `reactions` | `ReactionEntryList` | yes | 表情反应快照（由 ReactionEvent 驱动更新并持久化） |
| `replyTo` | `replyTo` | `String` | no |  |
| `senderAvatar` | `senderAvatar` | `String` | yes |  |
| `senderDisplayName` | `senderDisplayName` | `String` | yes | SDK计算展示名 |
| `senderId` | `senderId` | `String` | yes | 发送者 |
| `senderName` | `senderName` | `String` | yes |  |
| `serverId` | `serverId` | `String` | yes | 服务端唯一ID |
| `source` | `source` | `Int32` | yes | 消息来源 |
| `status` | `status` | `Int32` | yes |  |
| `textPreview` | `textPreview` | `String` | yes | 列表、搜索、绑定层使用的纯文本预览。 |
| `threadId` | `threadId` | `String` | no | 话题/线程根消息 ID；普通消息为空，话题回复使用该 typed field。 |
| `updatedAt` | `updatedAt` | `UInt64` | yes |  |
| `version` | `version` | `UInt64` | yes |  |
| `timelineKey` | `timelineKey` | `String` | yes | Core-computed stable row key for timeline rendering. |
| `timelineSortTs` | `timelineSortTs` | `UInt64` | yes | Core-computed timeline sort timestamp in milliseconds. |

### MessageSearchQuery

MessageSearchQuery

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | no |  |
| `fromTime` | `fromTime` | `UInt64` | no | 起始消息时间（毫秒，含）。 |
| `includeRecalled` | `includeRecalled` | `Boolean` | yes | 默认排除已撤回消息。 |
| `keyword` | `keyword` | `String` | no |  |
| `kinds` | `kinds` | `MessageSearchKindList` | yes |  |
| `limit` | `limit` | `UInt32` | yes |  |
| `senderId` | `senderId` | `String` | no |  |
| `toTime` | `toTime` | `UInt64` | no | 截止消息时间（毫秒，含）。 |

## Sync

Core-owned sync DTOs derived from Rust JsonSchema.

### ConversationVersion

Version stamp used by sync summary reconciliation.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes |  |
| `version` | `version` | `UInt64` | yes |  |

### SyncConversationSummariesRequest

Request for summary sync with client-known conversation versions.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `knownVersions` | `knownVersions` | `ConversationVersionList` | yes |  |

### SyncConversationSummariesResponse

Conversations whose local version is missing or newer than the caller's snapshot.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `changedConversations` | `changedConversations` | `ConversationVersionList` | yes |  |

### StartupHomeSyncRequest

Core-owned startup sync policy shared by all platform SDKs.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `backfillVisibleHistories` | `backfillVisibleHistories` | `Boolean` | yes |  |
| `conversationLimit` | `conversationLimit` | `UInt32` | yes |  |
| `historyBackfillLimit` | `historyBackfillLimit` | `Int32` | yes |  |
| `historyBackfillMaxConversations` | `historyBackfillMaxConversations` | `UInt32` | yes |  |
| `historyBackfillMaxPagesPerConversation` | `historyBackfillMaxPagesPerConversation` | `UInt32` | yes |  |
| `startBackgroundConvergence` | `startBackgroundConvergence` | `Boolean` | yes |  |

### StartupHomeSyncResponse

First usable home snapshot plus diagnostics about the startup sync path.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `backgroundConvergenceStarted` | `backgroundConvergenceStarted` | `Boolean` | yes |  |
| `coldSyncPerformed` | `coldSyncPerformed` | `Boolean` | yes |  |
| `degradedReason` | `degradedReason` | `String` | no |  |
| `servedFromLocal` | `servedFromLocal` | `Boolean` | yes |  |
| `snapshot` | `snapshot` | `HomeTimelineSnapshot` | yes |  |

## Session

Session utility request and response models.

### Enums

- `HeartbeatAppState`: Application visibility state used by adaptive heartbeat scheduling. Values: `foreground`, `background`

### SetHeartbeatAppStateRequest

Runtime app visibility update for adaptive heartbeat scheduling.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `appState` | `appState` | `HeartbeatAppState` | yes | Current application visibility state. |

### SetHeartbeatNatTimeoutRequest

Runtime NAT timeout hint for adaptive heartbeat scheduling. Omit or pass null to clear the hint.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `natTimeoutSecs` | `natTimeoutSecs` | `UInt32` | no | Observed NAT idle timeout in seconds. |

### HeartbeatEffectiveIntervalResponse

Currently effective heartbeat interval for diagnostics and platform observability.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `connected` | `connected` | `Boolean` | yes | Whether a live transport is available. |
| `intervalMs` | `intervalMs` | `UInt64` | no | Effective heartbeat interval in milliseconds when connected. |
| `intervalSecs` | `intervalSecs` | `UInt64` | no | Effective heartbeat interval in seconds when connected. |

### CoreTokenRequest

Explicit configuration for generating a Flare IM Core gateway-compatible HS256 access token.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `userId` | `userId` | `String` | yes | Subject user id stored in the JWT sub claim. |
| `secret` | `secret` | `String` | yes | HS256 signing secret configured on the gateway verifier. |
| `issuer` | `issuer` | `String` | yes | JWT issuer expected by the gateway verifier. |
| `ttlSecs` | `ttlSecs` | `UInt64` | yes | Token lifetime in seconds. |
| `deviceId` | `deviceId` | `String` | no | Optional device id claim. |
| `tenantId` | `tenantId` | `String` | no | Optional tenant id claim. |

### CoreTokenResponse

Generated core access token payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `token` | `token` | `String` | yes | Signed JWT access token. |

## Connection

Connection lifecycle requests and responses.

### Enums

- `NetworkInterfaceKind`: Standardized platform network interface kind for active reconnect hints. Values: `unknown`, `wifi`, `cellular`, `ethernet`, `other`

### NetworkChangeRequest

Platform network-change notification used to trigger active reconnect.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `available` | `available` | `Boolean` | no | Whether a network route is currently available. Omitted means available. |
| `interface` | `interface` | `NetworkInterfaceKind` | no | Standardized platform network interface hint. |
| `expensive` | `expensive` | `Boolean` | no | Whether the active route is considered expensive by the platform. |
| `metered` | `metered` | `Boolean` | no | Whether the active route is metered. |
| `reason` | `reason` | `String` | no | Optional platform reason string for diagnostics. |

### NetworkChangeResponse

Result of handling a platform network-change notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `reconnected` | `reconnected` | `Boolean` | yes | Whether the SDK had an active session and attempted reconnect. |

## Diagnostics

Runtime diagnostics and observability models.

### RuntimeHealthResponse

Runtime health snapshot including metrics and event drop counters.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `metricsEnabled` | `metricsEnabled` | `Boolean` | yes | Whether SDK metrics collection is enabled for this session. |
| `state` | `state` | `String` | yes | Current SDK connection state. |
| `stateCode` | `stateCode` | `Int32` | yes | Numeric SDK state code used by lower-level FFI state calls. |
| `sessionGeneration` | `sessionGeneration` | `UInt64` | yes | Current SDK session generation. |
| `rawSubscriberDroppedTotal` | `rawSubscriberDroppedTotal` | `UInt64` | yes | Total raw subscriber events dropped because bounded queues were full. |
| `metricsJson` | `metricsJson` | `String` | yes | JSON string for the metrics snapshot containing counters, gauges, and histograms. |

## Conversations

Conversation models mirrored from flare-im-core-sdk/src/model/conversation.rs.

### UpdateConversationDraftRequest

Typed request for updating the current user's synced conversation draft.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id whose draft is being updated. |
| `draft` | `draft` | `String` | no | Draft text. Omit or set null to clear the draft. |

### ListConversationsResponse

Conversation list response.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversations` | `conversations` | `ConversationList` | yes | Returned conversations. |

## Views

Core observable view models.

### OpenTimelineViewRequest

Request for opening an observable conversation timeline view.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id to observe. |
| `messageLimit` | `messageLimit` | `UInt32` | yes | Maximum messages to include in the initial snapshot. |

### OpenConversationListViewRequest

Request for opening an observable conversation list view.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationLimit` | `conversationLimit` | `UInt32` | yes | Maximum conversations to include in the initial snapshot. |

### LoadOlderTimelineViewRequest

Request for extending an open timeline view with older messages.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewId` | `viewId` | `String` | yes | Timeline view id returned from openTimeline. |
| `messageLimit` | `messageLimit` | `UInt32` | yes | Maximum older messages to load in this page. |

### CloseViewRequest

Request for closing an observable view.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewId` | `viewId` | `String` | yes | View id returned from an open view call. |

### ViewSnapshot

Tagged snapshot emitted by core observable views.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewType` | `viewType` | `String` | yes | Snapshot tag: timeline or conversationList. |
| `data` | `data` | `JsonObject` | yes | Snapshot payload selected by viewType. |

### ViewOpenResponse

Response returned when opening an observable view.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewId` | `viewId` | `String` | yes | Opened view id. |
| `snapshot` | `snapshot` | `ViewSnapshot` | yes | Initial snapshot for this view. |

### ViewDeltaOp

One operation in an observable view delta.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `op` | `op` | `String` | yes | Delta operation: insert, update, remove, or move. |
| `key` | `key` | `String` | yes | Stable item key owned by core. |
| `index` | `index` | `UInt32` | yes | Target index after applying the operation. |
| `fromIndex` | `fromIndex` | `UInt32` | no | Previous index for move operations. |
| `item` | `item` | `JsonObject` | no | Inserted or updated item payload. |

### ViewDelta

Typed delta emitted by core observable views.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewType` | `viewType` | `String` | yes | Delta tag: timeline or conversationList. |
| `ops` | `ops` | `ViewDeltaOpList` | yes | Ordered delta operations. |
| `conversation` | `conversation` | `Conversation` | no | Latest timeline conversation header for timeline deltas. |
| `hasMore` | `hasMore` | `Boolean` | no | Latest timeline pagination state for timeline deltas. |
| `totalUnread` | `totalUnread` | `UInt64` | no | Latest total unread value for conversation list deltas. |
| `syncState` | `syncState` | `String` | no | Latest sync state for conversation list deltas. |

### ViewUpdate

Observable view update event payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewId` | `viewId` | `String` | yes | Updated view id. |
| `kind` | `kind` | `String` | yes | Update kind: snapshot or delta. |
| `snapshot` | `snapshot` | `ViewSnapshot` | no | Latest snapshot for this view when kind is snapshot. |
| `delta` | `delta` | `ViewDelta` | no | View delta when kind is delta. |

### ViewLoadOlderResponse

Response returned after extending an observable timeline view.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `viewId` | `viewId` | `String` | yes | Updated timeline view id. |
| `loadedCount` | `loadedCount` | `UInt32` | yes | Number of older messages inserted into the view window. |
| `hasMore` | `hasMore` | `Boolean` | yes | Whether older messages may still be available. |
| `update` | `update` | `ViewUpdate` | no | Delta or snapshot that applies this page to the view. |

### CloseViewResponse

Response returned when closing an observable view.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `closed` | `closed` | `Boolean` | yes | Whether a view registration was closed. |

## Sync

Explicit sync reconciliation models.

### ConversationHistoryBackfillRequest

Request to backfill one conversation's historical messages into the local store.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Stable conversation id. |
| `limit` | `limit` | `Int32` | no | Maximum messages per backfill page. |
| `maxPages` | `maxPages` | `UInt32` | no | Maximum historical pages to request for this call. |

### ConversationHistoryBackfillResponse

Result of direct local-store historical backfill for one conversation.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Stable conversation id. |
| `pagesLoaded` | `pagesLoaded` | `UInt32` | yes | Number of older pages that advanced the local oldest seq. |
| `oldestSeqBefore` | `oldestSeqBefore` | `UInt64` | yes | Oldest local conversation seq before backfill. |
| `oldestSeqAfter` | `oldestSeqAfter` | `UInt64` | yes | Oldest local conversation seq after backfill. |
| `hasMore` | `hasMore` | `Boolean` | yes | Whether the server reported more history remains. |
| `completed` | `completed` | `Boolean` | yes | True when this call reached the earliest visible history or the server reported no more pages. |

## Messages

Message models mirrored from flare-im-core-sdk/src/model/message.rs and message_elem.rs.

### Enums

- `MessageContentType`: Decoded message content discriminator. Values: `text`, `image`, `video`, `audio`, `file`, `location`, `card`, `sticker`, `emoji`, `quote`, `link_card`, `forward`, `thread`, `mini_program`, `rich_text`, `image_group`, `system`, `notification`, `vote`, `task`, `schedule`, `announcement`, `custom`, `placeholder`

### MessageContent

Decoded content envelope. Type-specific payload lives in `data` until per-content models are generated.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `contentType` | `contentType` | `MessageContentType` | yes | Content discriminator. |
| `data` | `data` | `JsonObject` | yes | Content payload object. |

### CreateTextMessageRequest

Create a text message draft for a conversation.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `text` | `text` | `String` | yes | Text body. |

### SendMessageRequest

Send a fully built message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `message` | `message` | `Message` | yes | Message to send. |

### SendMessageResponse

Send acknowledgement returned by core-sdk.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `ackId` | `ackId` | `String` | yes | ACK id assigned by the transport layer, if present. |
| `serverId` | `serverId` | `String` | yes | Server-assigned message id. |
| `clientMsgId` | `clientMsgId` | `String` | yes | Client message id acknowledged by the server. |
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `seq` | `seq` | `UInt64` | yes | Assigned conversation sequence. |
| `timestamp` | `timestamp` | `UInt64` | yes | Server send time in milliseconds. |
| `success` | `success` | `Boolean` | yes | Whether this response contains a final accepted send ACK. |
| `errorCode` | `errorCode` | `Int32` | yes | Core ACK error code when success is false. |
| `errorMessage` | `errorMessage` | `String` | yes | Core ACK error message when success is false. |

### ListMessagesRequest

Page messages before a sequence in a conversation.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `beforeSeq` | `beforeSeq` | `UInt64` | yes | Fetch messages before this sequence; 0 means latest page. |
| `limit` | `limit` | `UInt32` | yes | Page size. |

### ListMessagesResponse

Message page response.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `messages` | `messages` | `MessageList` | yes | Returned messages. |

## MessageContentElems

Typed message content payloads mirrored from flare_proto message_content.proto. Use these instead of ad-hoc JsonObject in adapters.

### MediaSourceInfo

Image/video/audio/file source descriptor (uuid, url, dimensions).

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `uuid` | `uuid` | `String` | no | Stable media uuid. |
| `imageId` | `imageId` | `String` | no | Image id when applicable. |
| `url` | `url` | `String` | no | Resolved URL. |
| `mimeType` | `mimeType` | `String` | no | MIME type. |
| `size` | `size` | `UInt64` | no | Byte size. |
| `width` | `width` | `Int32` | no | Width in pixels. |
| `height` | `height` | `Int32` | no | Height in pixels. |
| `blurhash` | `blurhash` | `String` | no | Blurhash placeholder for image previews. |
| `durationMs` | `durationMs` | `Int32` | no | Duration for audio/video. |

### TextContentPayload

Text message body.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `text` | `text` | `String` | yes | Plain text body. |

### ImageContentPayload

Image message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `imageId` | `imageId` | `String` | no | Uploaded image id. |
| `source` | `source` | `MediaSourceInfo` | no | Source descriptor. |
| `thumbnail` | `thumbnail` | `MediaSourceInfo` | no | Thumbnail descriptor. |
| `description` | `description` | `String` | no | Caption. |

### ImageGroupItem

One image inside an image group.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `imageId` | `imageId` | `String` | yes | Image id. |
| `url` | `url` | `String` | no | Resolved URL. |
| `title` | `title` | `String` | no | Item title. |
| `width` | `width` | `Int32` | no | Width. |
| `height` | `height` | `Int32` | no | Height. |

### ImageGroupContentPayload

Image group payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `images` | `images` | `ImageGroupItemList` | yes | Grouped images. |
| `title` | `title` | `String` | no | Group title. |

### VideoContentPayload

Video message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `videoId` | `videoId` | `String` | no | Uploaded video id. |
| `source` | `source` | `MediaSourceInfo` | no | Video source. |
| `cover` | `cover` | `MediaSourceInfo` | no | Cover image. |
| `description` | `description` | `String` | no | Caption. |

### AudioContentPayload

Audio message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `audioId` | `audioId` | `String` | no | Uploaded audio id. |
| `source` | `source` | `MediaSourceInfo` | no | Audio source. |
| `durationMs` | `durationMs` | `Int32` | no | Duration. |

### FileContentPayload

File message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `fileId` | `fileId` | `String` | no | Uploaded file id. |
| `name` | `name` | `String` | no | Display name. |
| `url` | `url` | `String` | no | Download URL. |
| `mimeType` | `mimeType` | `String` | no | MIME type. |
| `size` | `size` | `UInt64` | no | Byte size. |

### EmojiContentPayload

Emoji message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `emoji` | `emoji` | `String` | yes | Emoji key or unicode. |

### StickerContentPayload

Sticker message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `stickerId` | `stickerId` | `String` | yes | Sticker id. |
| `packageId` | `packageId` | `String` | no | Sticker package id. |
| `url` | `url` | `String` | no | Sticker URL. |
| `width` | `width` | `Int32` | no | Width. |
| `height` | `height` | `Int32` | no | Height. |
| `format` | `format` | `String` | no | webp/gif/png. |

### ForwardSourceMessage

One source message inside a forward bundle.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `sourceMessageId` | `sourceMessageId` | `String` | yes | Original message id. |
| `sourceConversationId` | `sourceConversationId` | `String` | no | Original conversation id. |
| `sourceSenderId` | `sourceSenderId` | `String` | no | Original sender id. |
| `plainText` | `plainText` | `String` | no | Preview text. |

### ForwardContentPayload

Forward message payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `merge` | `merge` | `Boolean` | no | Merge forwarded messages into one card. |
| `title` | `title` | `String` | no | Forward title. |
| `sourceMessages` | `sourceMessages` | `ForwardSourceMessageList` | yes | Forwarded sources. |

## MessageBuilder

Typed requests for messageBuilder quick-build APIs and catalog metadata.

### Enums

- `MessageBuildOp`: Dispatch op passed to flare_message_build_json. Values: `create_text`, `create_quote`, `create_thread_reply`, `create_forward`, `create_image`, `create_image_group`, `create_video`, `create_audio`, `create_file`, `create_emoji`, `create_location`, `create_sticker`, `create_link_card`, `create_card`, `create_mini_program`, `create_rich_doc`, `create_system`, `create_notification`, `create_vote`, `create_task`, `create_schedule`, `create_announcement`, `create_custom`, `create_placeholder`, `create_with_content`

### MessageBuildCatalogEntry

One supported quick-build operation exposed on MessageBuilderApi.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `op` | `op` | `MessageBuildOp` | yes | Build dispatch op. |
| `method` | `method` | `String` | yes | Facade method name, e.g. buildText. |
| `requestType` | `requestType` | `String` | yes | Typed request model name. |
| `contentType` | `contentType` | `MessageContentType` | yes | Decoded content discriminator. |
| `messageType` | `messageType` | `Int32` | yes | Core message type integer. |
| `summary` | `summary` | `String` | yes | Human-readable summary for UI/docs. |
| `stability` | `stability` | `String` | yes | stable \| beta \| experimental |

### ListMessageBuildCatalogResponse

Catalog of all supported message build operations.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `entries` | `entries` | `MessageBuildCatalogEntryList` | yes | Supported build operations. |

### BuildTypedMessageRequest

Generic typed build request used by composer helpers.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `op` | `op` | `MessageBuildOp` | yes | Build operation. |
| `data` | `data` | `JsonObject` | no | Operation-specific payload; prefer typed buildXxx requests. |

### BuildTextMessageRequest

Build a text message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `text` | `text` | `String` | yes | Text body. |
| `mentionUsers` | `mentionUsers` | `StringList` | no | User ids mentioned in the text body. The core builder resolves @userId spans into typed mentions. |
| `mentionAll` | `mentionAll` | `Boolean` | no | Whether the message mentions every member in the target conversation. |

### BuildQuoteMessageRequest

Build a quote/reply message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `quotedMessageId` | `quotedMessageId` | `String` | yes | Quoted message id. |
| `text` | `text` | `String` | yes | Reply text. |
| `quotedSenderId` | `quotedSenderId` | `String` | no | Quoted sender id. |
| `quotedTextPreview` | `quotedTextPreview` | `String` | no | Quoted preview text. |
| `quotedContent` | `quotedContent` | `MessageContent` | yes | Quoted message content element. |

### BuildThreadReplyMessageRequest

Build a thread reply message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `threadId` | `threadId` | `String` | yes | Thread root message id. |
| `text` | `text` | `String` | yes | Reply text. |

### BuildForwardMessageRequest

Build a forward message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `merge` | `merge` | `Boolean` | no | Merge into one card. |
| `title` | `title` | `String` | yes | Forward title. |
| `sourceMessages` | `sourceMessages` | `ForwardSourceMessageList` | yes | Messages to forward. |

### BuildImageMessageRequest

Build an image message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `imageId` | `imageId` | `String` | yes | Uploaded image id. |
| `payload` | `payload` | `ImageContentPayload` | no | Optional rich image payload for UI preview. |

### BuildImageGroupMessageRequest

Build an image group message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `payload` | `payload` | `ImageGroupContentPayload` | yes | Image group payload. |

### BuildVideoMessageRequest

Build a video message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `videoId` | `videoId` | `String` | yes | Uploaded video id. |
| `payload` | `payload` | `VideoContentPayload` | no | Optional video payload. |

### BuildAudioMessageRequest

Build an audio message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `audioId` | `audioId` | `String` | yes | Uploaded audio id. |
| `payload` | `payload` | `AudioContentPayload` | no | Optional audio payload. |

### BuildFileMessageRequest

Build a file message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `fileId` | `fileId` | `String` | yes | Uploaded file id. |
| `payload` | `payload` | `FileContentPayload` | no | Optional file payload. |

### BuildEmojiMessageRequest

Build an emoji message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `emoji` | `emoji` | `String` | yes | Emoji key. |

### BuildLocationMessageRequest

Build a location message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `latitude` | `latitude` | `Double` | yes | Latitude. |
| `longitude` | `longitude` | `Double` | yes | Longitude. |
| `title` | `title` | `String` | no | Place title. |
| `address` | `address` | `String` | no | Address. |

### BuildStickerMessageRequest

Build a sticker message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `stickerId` | `stickerId` | `String` | yes | Sticker id. |
| `packageId` | `packageId` | `String` | no | Sticker package id. |
| `payload` | `payload` | `StickerContentPayload` | no | Optional sticker payload. |

### BuildLinkCardMessageRequest

Build a link card message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `url` | `url` | `String` | yes | Link URL. |
| `title` | `title` | `String` | no | Card title. |
| `description` | `description` | `String` | no | Card description. |
| `thumbnailUrl` | `thumbnailUrl` | `String` | no | Thumbnail URL. |
| `siteName` | `siteName` | `String` | no | Site name. |

### BuildCardMessageRequest

Build a structured card message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `id` | `id` | `String` | yes | Card target id. |
| `cardType` | `cardType` | `String` | no | Card type key. |
| `title` | `title` | `String` | no | Display title. |
| `subtitle` | `subtitle` | `String` | no | Display subtitle. |
| `avatar` | `avatar` | `String` | no | Avatar URL or media id. |

### BuildMiniProgramMessageRequest

Build a mini program message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `appId` | `appId` | `String` | yes | Mini program app id. |
| `pagePath` | `pagePath` | `String` | no | Entry path. |
| `title` | `title` | `String` | no | Display title. |
| `thumbnailUrl` | `thumbnailUrl` | `String` | no | Thumbnail URL. |
| `extra` | `extra` | `StringMap` | no | Mini program extension fields. |

### BuildRichDocMessageRequest

Build a rich document message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `docJson` | `docJson` | `String` | yes | RichDoc JSON document. |
| `contentSchema` | `contentSchema` | `String` | yes | Content schema, normally rich_doc. |
| `plainText` | `plainText` | `String` | yes | Human-readable plain text. |
| `inputFormat` | `inputFormat` | `String` | no | Original source format when known. |
| `inputFormatVersion` | `inputFormatVersion` | `Int32` | no | Original source format version. |
| `sourcePayload` | `sourcePayload` | `StringMap` | no | Original source payload snapshot keyed by format. |
| `title` | `title` | `String` | no | Rich document title. |
| `searchText` | `searchText` | `String` | no | Search-indexable text. |
| `renderHintsJson` | `renderHintsJson` | `String` | no | Renderer hints JSON. |

### NormalizeRichDocFromMarkdownRequest

Normalize Markdown into RichDoc v2 JSON and derived fields.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `markdown` | `markdown` | `String` | yes | Markdown source. |

### NormalizeRichDocFromHtmlRequest

Normalize an HTML fragment into RichDoc v2 JSON and derived fields.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `html` | `html` | `String` | yes | HTML fragment source. |

### NormalizeRichDocFromDocJsonRequest

Validate editor-produced RichDoc v2 JSON and derive searchable/render fields.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `docJson` | `docJson` | `String` | yes | RichDoc v2 document JSON. |

### RichDocV2Normalized

Normalized RichDoc v2 payload aligned with core NormalizeOutput.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `docJson` | `docJson` | `String` | yes | Canonical RichDoc v2 JSON document. |
| `contentSchema` | `contentSchema` | `String` | yes | Content schema, normally rich_doc. |
| `version` | `version` | `UInt32` | yes | RichDoc schema version. |
| `plainText` | `plainText` | `String` | yes | Human-readable plain text extracted from the document. |
| `searchText` | `searchText` | `String` | yes | Search-indexable text extracted from the document. |
| `renderHints` | `renderHints` | `JsonObject` | yes | Renderer hint object derived by core. |
| `inputFormat` | `inputFormat` | `String` | no | Original source format when known. |
| `sourcePayload` | `sourcePayload` | `JsonObject` | no | Original source payload snapshot keyed by format. |

### BuildSystemMessageRequest

Build a system message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `eventKind` | `eventKind` | `String` | yes | System event kind. |
| `body` | `body` | `String` | yes | System event body. |

### BuildNotificationMessageRequest

Build a notification message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `title` | `title` | `String` | yes | Notification title. |
| `body` | `body` | `String` | yes | Notification body. |

### BuildVoteMessageRequest

Build a vote message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `voteId` | `voteId` | `String` | yes | Vote id. |
| `title` | `title` | `String` | yes | Vote title. |
| `options` | `options` | `StringList` | yes | Vote options. |
| `participantUserIds` | `participantUserIds` | `StringList` | yes | Participants allowed to vote. |

### BuildTaskMessageRequest

Build a task message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `taskId` | `taskId` | `String` | yes | Task id. |
| `title` | `title` | `String` | yes | Task title. |
| `status` | `status` | `String` | no | Task status. |
| `participantUserIds` | `participantUserIds` | `StringList` | yes | Task participants. |

### BuildScheduleMessageRequest

Build a schedule message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `scheduleId` | `scheduleId` | `String` | yes | Schedule id. |
| `title` | `title` | `String` | yes | Schedule title. |
| `startTimeMs` | `startTimeMs` | `Int64` | yes | Start time in milliseconds since epoch. |
| `endTimeMs` | `endTimeMs` | `Int64` | yes | End time in milliseconds since epoch. |
| `participantUserIds` | `participantUserIds` | `StringList` | yes | Schedule participants. |

### BuildAnnouncementMessageRequest

Build an announcement message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `title` | `title` | `String` | yes | Announcement title. |
| `body` | `body` | `String` | yes | Announcement body. |

### BuildCustomMessageRequest

Build a custom extension message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `type` | `type` | `String` | yes | Extension type key. |

### BuildPlaceholderMessageRequest

Build a placeholder message.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `reason` | `reason` | `String` | yes | Placeholder reason. |

### BuildWithContentMessageRequest

Build from an existing MessageContent envelope.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Target conversation id. |
| `content` | `content` | `MessageContent` | yes | Decoded content envelope. |

## Events

Typed SDK event and notification models for cross-platform subscriptions.

### Enums

- `SdkEventKind`: Top-level event domain. Values: `lifecycle`, `connection`, `message`, `notification`, `conversation`, `sync`, `extension`, `extension_event`, `presence`, `media`, `capability`, `view`

- `LifecycleEventName`: Client SDK lifecycle notification name. Values: `initializing`, `initialized`, `init_failed`, `login_succeeded`, `login_failed`, `logged_out`, `disposed`

- `SdkConnectionState`: Connection state exposed by event payloads. Values: `disconnected`, `connecting`, `connected`, `ready`, `reconnecting`

- `ConnectionEventName`: Connection event notification name. Values: `connecting`, `connected`, `ready`, `disconnected`, `reconnecting`, `reconnect_failed`, `state_changed`, `sync_state_changed`, `server_error`, `kicked_off`, `token_expired`

- `MessageEventName`: Message event notification name. Values: `received`, `received_batch`, `send_ack`, `send_failed`, `capability`, `recalled`, `typing`, `typing_aggregate`, `edited`, `reaction_changed`, `deleted`, `read_receipt`, `burn_scheduled`, `burned`, `hard_deleted`, `pinned`, `unpinned`, `marked`, `unmarked`, `retention_scheduled`, `retention_expired`, `retention_purged`, `presence_changed`, `call_signal`, `custom`

- `ConversationEventName`: Conversation event notification name. Values: `synced`, `created`, `updated`, `unread_count_changed`, `deleted`

- `SyncEventName`: Sync orchestration event notification name. Values: `state_changed`, `started`, `finished`, `failed`, `progress`, `task_completed`, `resync_needed`, `readiness`

- `ProgressEventName`: Progress notification name. Values: `sync_progress`, `upload_progress`, `download_progress`

- `CapabilityEventName`: Capability and plugin event notification name. Values: `changed`, `unavailable`

### SdkErrorPayload

Stable error payload used by lifecycle and async notification failures.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `code` | `code` | `String` | yes | Stable machine-readable error code. |
| `message` | `message` | `String` | yes | Human-readable error message. |
| `operation` | `operation` | `String` | no | Operation that failed. |
| `retryable` | `retryable` | `Boolean` | no | Whether retrying may succeed. |
| `details` | `details` | `StringMap` | yes | Opaque diagnostic details. |

### SdkEventEnvelope

Common event envelope emitted by every platform SDK event stream.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `eventId` | `eventId` | `String` | yes | Unique event id generated by the SDK adapter. |
| `kind` | `kind` | `SdkEventKind` | yes | Top-level event domain. |
| `name` | `name` | `String` | yes | Domain-specific event name. |
| `occurredAt` | `occurredAt` | `UInt64` | yes | Event time in milliseconds. |
| `traceId` | `traceId` | `String` | no | Trace id for diagnostics when available. |
| `payload` | `payload` | `JsonObject` | yes | Raw event payload for forward-compatible consumers. |

### LifecycleEvent

Lifecycle notification. Method return values remain the primary success/failure contract.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `LifecycleEventName` | yes | Lifecycle event name. |
| `operation` | `operation` | `String` | yes | Operation associated with this lifecycle event. |
| `userId` | `userId` | `String` | no | Current user id when known. |
| `sessionId` | `sessionId` | `String` | no | SDK session id when available. |
| `error` | `error` | `SdkErrorPayload` | no | Failure details for *_failed events. |

### ConnectionEvent

Connection notification payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `ConnectionEventName` | yes | Connection event name. |
| `state` | `state` | `SdkConnectionState` | yes | Connection state after this event. |
| `reason` | `reason` | `String` | no | Disconnect, kicked-off, or token-expired reason. |
| `attempt` | `attempt` | `UInt32` | no | Reconnect attempt number. |
| `error` | `error` | `SdkErrorPayload` | no | Server or reconnect failure details. |

### MessageReceivedEvent

Single message received notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `message` | `message` | `Message` | yes | Received message. |

### MessageReceivedBatchEvent

Batch message received notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `messages` | `messages` | `MessageList` | yes | Received messages. |

### MessageSendAckEvent

Message send acknowledgement notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `ack` | `ack` | `SendMessageResponse` | yes | Send acknowledgement. |

### MessageSendFailedEvent

Message send failure notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `clientMsgId` | `clientMsgId` | `String` | yes | Client message id that failed. |
| `reason` | `reason` | `String` | yes | Failure reason. |
| `error` | `error` | `SdkErrorPayload` | no | Structured failure details when available. |

### MessageMutationEvent

Message mutation notification for recall, edit, delete, pin, mark and burn events.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `MessageEventName` | yes | Mutation event name. |
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `messageId` | `messageId` | `String` | no | Client or server message id. |
| `serverMsgId` | `serverMsgId` | `String` | no | Server message id. |
| `userId` | `userId` | `String` | no | User associated with the mutation. |
| `reason` | `reason` | `String` | no | Mutation reason when available. |

### TypingEvent

Typing/input-state notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `userId` | `userId` | `String` | yes | Typing user id. |
| `typing` | `typing` | `Boolean` | yes | Whether user is typing. |

### TypingAggregateEvent

Aggregated typing/input-state notification for large conversations.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `typingUserIds` | `typingUserIds` | `StringList` | yes | Users currently typing in the aggregation window. |
| `typingCount` | `typingCount` | `UInt32` | yes | Number of users currently typing in the aggregation window. |

### ReadReceiptEvent

Read receipt notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `userId` | `userId` | `String` | yes | Reader user id. |
| `readSeq` | `readSeq` | `UInt64` | yes | Read sequence. |

### ReactionChangedEvent

Message reaction changed notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | yes | Conversation id. |
| `serverMsgId` | `serverMsgId` | `String` | yes | Server message id. |
| `userId` | `userId` | `String` | yes | User who changed the reaction. |
| `emoji` | `emoji` | `String` | yes | Reaction emoji. |
| `action` | `action` | `Int32` | yes | Reaction action integer from core. |

### ConversationEvent

Conversation notification payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `ConversationEventName` | yes | Conversation event name. |
| `conversationId` | `conversationId` | `String` | no | Affected conversation id. |
| `conversationIds` | `conversationIds` | `StringList` | yes | Affected conversation ids for sync events. |
| `unreadCount` | `unreadCount` | `UInt32` | no | Unread count for unread-count changes. |

### PresenceChangedEvent

Presence notification payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `conversationId` | `conversationId` | `String` | no | Conversation id when presence is scoped to a conversation. |
| `userId` | `userId` | `String` | yes | User id. |
| `status` | `status` | `String` | yes | Presence status. |
| `extra` | `extra` | `StringMap` | yes | Opaque presence details. |

### ProgressEvent

Generic sync, upload or download progress notification.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `ProgressEventName` | yes | Progress event name. |
| `operation` | `operation` | `String` | yes | Operation being tracked. |
| `current` | `current` | `UInt64` | yes | Current progress units. |
| `total` | `total` | `UInt64` | yes | Total progress units. |
| `taskId` | `taskId` | `String` | no | Task identifier when available. |
| `detail` | `detail` | `String` | no | Human-readable progress detail. |

### SyncEvent

Sync orchestration notification payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `SyncEventName` | yes | Sync event name. |
| `runId` | `runId` | `String` | no | Stable sync run id used to correlate readiness, progress, and completion. |
| `trigger` | `trigger` | `String` | no | Sync trigger. |
| `scope` | `scope` | `String` | no | Sync scope. |
| `visibility` | `visibility` | `String` | no | Sync visibility policy. |
| `reason` | `reason` | `String` | no | Sync reason for diagnostics and startup wait reports. |
| `phase` | `phase` | `String` | no | Sync phase. |
| `task` | `task` | `String` | no | Sync task name. |
| `stage` | `stage` | `String` | no | Readiness stage for sync.readiness events. |
| `progress` | `progress` | `UInt32` | no | Progress percentage from 0 to 100. |
| `error` | `error` | `SdkErrorPayload` | no | Failure details for failed sync events. |

### CapabilityEvent

Capability/plugin notification payload.

| Field | Wire name | Type | Required | Description |
|-------|-----------|------|----------|-------------|
| `name` | `name` | `CapabilityEventName` | yes | Capability event name. |
| `capability` | `capability` | `String` | no | Capability key. |
| `reason` | `reason` | `String` | no | Unavailable/change reason. |
