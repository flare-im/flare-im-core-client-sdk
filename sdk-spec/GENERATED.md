# Generated Contract Index

> Generated from split sdk-spec files

- API version: `0.3.0`
- FFI contract: `flare-im-ffi/v1`
- Core source: `../flare-im-core-sdk`

## Modules

| Module | Facade | Methods |
|--------|--------|---------|
| `session` | `client` | `create`, `init`, `uninit`, `login`, `prepare`, `connect`, `updateAccessToken`, `setHeartbeatAppState`, `setHeartbeatNatTimeout`, `heartbeatEffectiveInterval`, `logout`, `dispose`, `hardReset`, `currentUserId`, `isConnected`, `sessionActive`, `generateCoreToken` |
| `connection` | `client.connection` | `getConnectionState`, `disconnect`, `notifyNetworkChange` |
| `conversations` | `client.conversations` | `listConversations`, `listConversationsByQuery`, `listConversationsIncludingArchived`, `getConversation`, `getOneConversation`, `getGroupConversationByUserIds`, `getMultipleConversations`, `listConversationsPaginated`, `listRawConversations`, `bootstrapHomeTimeline`, `openConversationTimeline`, `markConversationRead`, `setConversationPinned`, `setConversationMuted`, `setConversationArchived`, `markConversationUnread`, `deleteConversation`, `updateConversationDraft`, `clearLocalChatHistory` |
| `message_builder` | `client.messageBuilder` | `listSupportedBuildOperations`, `normalizeRichDocFromMarkdown`, `normalizeRichDocFromHtml`, `normalizeRichDocFromDocJson`, `buildAnnouncement`, `buildAudio`, `buildCard`, `buildCustom`, `buildEmoji`, `buildFile`, `buildForward`, `buildImage`, `buildImageGroup`, `buildLinkCard`, `buildLocation`, `buildMiniProgram`, `buildNotification`, `buildPlaceholder`, `buildQuote`, `buildRichDoc`, `buildSchedule`, `buildSticker`, `buildSystem`, `buildTask`, `buildText`, `buildThreadReply`, `buildVideo`, `buildVote`, `buildWithContent` |
| `messages` | `client.messages` | `createTextMessage`, `dispatchMessage`, `sendMessageNoOss`, `sendMessage`, `listMessages`, `recallMessage`, `editTextByMessageId`, `deleteMessage`, `deleteMessageForSelf`, `deleteMessageForEveryone`, `markMessageReadAndBurn`, `addReaction`, `removeReaction`, `pinMessage`, `unpinMessage`, `pinMessageById`, `unpinMessageById`, `markMessage`, `markMessageWithColor`, `unmarkMessage`, `markMessageById`, `unmarkMessageById`, `getMessage`, `getRawMessage`, `searchMessages`, `searchMessagesByQuery`, `searchMessagesInConversation`, `editRichDocByMessageId`, `setTyping` |
| `sync` | `client.sync` | `syncConversationSummaries`, `syncConversationSummariesWithVersions`, `bootstrapStartupHome`, `backfillConversationHistory`, `syncConversation`, `syncMessages` |
| `user` | `client.user` | `upsertUserProfiles` |
| `presence` | `client.presence` | `getUserPresence`, `batchGetUserPresence`, `subscribeUserPresence` |
| `media` | `client.media` | `uploadFile`, `uploadImage`, `uploadVideo`, `uploadBytes`, `deleteFile`, `getMediaUrl`, `getTempDownloadUrl`, `resolveMediaAccess`, `cacheRemoteMedia`, `getMediaCacheStats`, `setMediaCacheMaxBytes`, `setMediaCacheRoot`, `clearMediaCache`, `getUserDownloadSubfolder`, `setUserDownloadSubfolder`, `getUserDownloadSavedPath`, `deleteUserDownloadRecord`, `cancelUserFileDownload`, `downloadFileToDownloads` |
| `capabilities` | `client.capabilities` | `listCapabilities`, `listUserCapabilities`, `dispatchCapability`, `grantCapability`, `revokeCapability`, `sendCallSignal` |
| `views` | `client.views` | `openTimeline`, `loadOlderTimeline`, `openConversationList`, `close` |
| `events` | `client.events` | `subscribeEvents`, `subscribeEventsBatch`, `unsubscribe`, `unsubscribeAll` |
| `diagnostics` | `client.diagnostics` | `getSdkVersion`, `getFfiContractVersion`, `getDataRoot`, `getRuntimeHealth` |

## Platforms

| Key | Package | Status | Async model |
|-----|---------|--------|-------------|
| `dart` | `packages/flare-core-flutter-sdk` | `contract-synced` | Future + Stream |
| `android` | `packages/flare-core-android-sdk` | `contract-synced` | suspend + Flow |
| `ios` | `packages/flare-core-apple-sdk` | `contract-synced` | async/await + AsyncStream |
| `arkts` | `packages/flare-core-harmony-arkts-sdk` | `contract-synced` | Promise + typed event emitter |
| `cangjie` | `packages/flare-core-harmony-cangjie-sdk` | `contract-synced` | native async result |
| `typescript` | `packages/flare-core-typescript-sdk` | `contract-synced` | Promise + event subscription |
| `web` | `packages/flare-core-typescript-sdk` | `contract-synced` | Promise + event subscription |
| `react-native` | `packages/flare-core-typescript-sdk` | `contract-synced` | Promise + native event emitter |
| `uni-app` | `packages/flare-core-typescript-sdk` | `contract-synced` | Promise + event subscription |
| `tauri` | `packages/flare-core-typescript-sdk` | `contract-synced` | Promise + event subscription |
