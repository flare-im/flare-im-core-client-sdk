# 示例 App 能力对齐清单(对照 core SDK)

> 源真相:`sdk-spec/modules/*.json`(契约,12 模块、116 操作)。本文件是逐端补齐检查表。基准实现:`flare-core-flutter-app`。更新:2026-06-27。
>
> **2026-06-27 iOS 架构升级 + 复核修正(98 → 97/116)**:`flare-core-ios-app` 完成一轮工程化重构 —— 国际化(String Catalog en+zh-Hans 双语)、全面 MVVM(5 个 ViewModel + `AppLifecycle` 协议,视图零直读 store)、平台服务收敛(`Core/Platform/`)、`MessageBuilder` 抽取(VM 789→417 行)、设计 token(Radius/Spacing/Typography 标尺)。
> - **重构本身不增删 SDK 操作**:逐操作 116 行 grep 复核 → 重构触及的 20 个 `✓` 全部无回归、18 个 `·` 全部仍 `·`。
> - **复核发现一处历史误标并修正**:`session.connect` 此前 iOS 记 `✓`,但全仓**无 word-boundary `\bconnect\b`** —— 登录流程是 `client.init` → `client.login` → 读 `client.connection.getConnectionState()`,连接由 init/login **隐式建立**,无独立 `connect()` 调用。按本文档 word-boundary 方法学,正解为 `·`(等价覆盖)。故 iOS 98 → **97**。此为既有误标修正,非重构回归。
> - 验证:`swift build` + `swift test`(32 pass/4 skip) + `xcodebuild` iPhone 17 sim BUILD SUCCEEDED。iOS 现已是"干净 MVVM + 双语 + 设计系统"的参考实现。
>
> **2026-06-27 Android 整体重写(21 → 105/116,达成并超越 iOS 对齐)**:`flare-core-android-sdk` 早已 1:1 暴露全部 116 op,差距纯在示例 App。镜像 iOS 干净 MVVM 重写:`core/{session,data,domain}` + 5 个特性 VM + `features/shell` Compose 六屏 + `FlareTheme` 设计系统 + i18n。覆盖 105(11 个 `·` 与 iOS 同为等价覆盖,非真缺)。验证:`:app:assembleDebug` BUILD SUCCESSFUL(JDK17)。详见下「Android」节与 app `PLAN.md`。Android 自此**不再是补齐重灾区**。

## 重要前提:6 个示例 App,其中 web/electron/uni/tauri 复用同一套 Vue workbench blocks
- **原生独立实现(各一套 UI)**:Flutter(Dart)、Android(Kotlin)、iOS(SwiftUI)。
- **web / electron / uni / tauri**:四端都复用 `packages/@flare-im/vue-ui/app` 暴露的 workbench 组件、SDK context、media/desktop/transport adapter hooks,但各端自己维护 `App.vue`、`router.ts`、route guard、history 模式和平台初始化。因此 UI 业务能力按共享包统计,应用壳/平台集成按各端统计。
- 另存在 `flare-core-rn-app`(React Native),本清单未并入。

## 方法学与告警(必读)
- 自动 grep:把 `sdk-spec` 每个操作名(如 `addReaction`/`searchMessages`)逐个 **word-boundary 大小写不敏感 grep** 各代码库:
  - Flutter = `flare-core-flutter-app/lib`
  - Android = `flare-core-android-app/app/src/main`
  - iOS = `flare-core-ios-app/Sources`
  - **web / electron / uni / tauri 的有效 UI 覆盖 = 共享包 `packages/@flare-im/vue-ui/src` + 各自 `src/App.vue`/`src/router.ts` 壳**(矩阵中 web/uni/tauri 三列仍按共享包能力计;若只 grep 各自薄壳会被误判为空)。
- `✓` = 操作名出现(强信号:被调用);`·` = 未出现。
- ⚠️ **`·` 不一定 = 缺功能**:有的端用了**等价操作**(如 iOS 用 `listConversationsPaginated` 代 `listConversations`)。补齐前需人工复核 `·` 是真缺还是等价覆盖。**Android 2026-06-27 重写后,其 11 个 `·` 与 iOS 同属等价覆盖**(`*ById` / `getOne` / paginated 变体),非真缺。

## 覆盖总览(/116)
| 端 | 覆盖 | 类型/运行形态 | 结论 |
|---|:--:|---|---|
| **Flutter** | **113** | 原生 Dart | 基准,近乎完整;可跑 ✅ |
| **iOS** | **97** | 原生 SwiftUI | 较全(已补 14 项,见下);**✅ 模拟器可运行**;**2026-06-27 工程化重构(i18n/全面 MVVM/平台抽象/MessageBuilder/设计 token)+ 复核修正 `session.connect` 历史误标(98→97)** |
| **Android** | **105** | 原生 Kotlin (Compose) | **2026-06-27 重写达成并超越 iOS 对齐**:干净 MVVM（镜像 iOS Core/Features）+ Compose 六屏 UI + FlareTheme 设计系统 + i18n（en/zh）；`:app:assembleDebug` BUILD SUCCESSFUL ✅ |
| **web** | **99** | Vue + `@flare-im/sdk`(WASM) | 共享 workbench blocks + web app/router 壳;2026-06-28 补 4 真缺(prepare/uninit/hardReset/sendMessageNoOss) |
| **uni** | **99** | Vue + uni 跨端(`uniFlarePlatform`) | 共享 workbench blocks + uni app/router 壳 |
| **tauri** | **99** | Vue + `@flare-im/sdk/tauri`(桌面/Rust) | 共享 workbench blocks + Tauri app/router 壳 |

> web / uni / tauri 的 `99` 三列**数值相同**(共享 Vue UI)。三者真正的区别在**平台集成**,非 UI 能力 —— 见下表。

## 平台集成差异(web vs uni vs tauri —— 三者的真实区别)
| 维度 | web | uni | tauri |
|---|---|---|---|
| 客户端 SDK | `@flare-im/sdk`(WASM core) | 共享 Vue + `uniFlarePlatform` 适配 | `@flare-im/sdk/tauri`(Rust 桌面后端) |
| 运行形态 | 浏览器 | App / H5 / 小程序 | 桌面(`src-tauri` Rust 后端) |
| 媒体 | 媒体代理 / Cache API | SQLite 本地库 / 原生录音 | 本地路径解析 + 文件选择器(`configureAppMediaLocalPathResolver/PathPicker`) |
| 原生能力 | — | 原生录音、SQLite | 桌面通知、文件对话框(open/reveal)、传输选择器、dev CA 证书 |
| 入口/壳 | `src/main.ts`(薄壳) | `pages/index/index.vue`(7 行)+ `manifest.json` | `src/main.ts` + `desktopNotifications.ts` + `src-tauri` |

> 运行就绪度:Flutter ✅ 可跑;Android ✅ 可构建;**iOS ✅ 已可在模拟器运行(2026-06-26)** —— ① `scripts/sync_ffi.sh` 同步 FFI 产物;② apple-sdk 桥接 `@convention(c)` 修复(13 个 C 函数 binding 漏标 → Swift 6.3 `unsafeBitCast` 崩溃);③ `project.yml`(xcodegen)生成 app 工程,静态链 sim `.a` + `-force_load`/`-export_dynamic`。实测:`xcodebuild` BUILD SUCCEEDED + iPhone 17 模拟器 `simctl launch` 启动渲染登录页;`FLARE_FFI_DYLIB=… swift test` 过。运行步骤见 `flare-core-ios-app/README.md`。web 需 `npm install`+core 后 `vite dev`;uni 需 uni 端构建;tauri 需 `tauri dev`(含 `src-tauri` Rust 构建)。

---

## 逐端补齐清单

### Android(21 → 105;✅ assembleDebug 通过;2026-06-27 整体重写达成并超越 iOS 对齐）
- ✅ **架构重写（镜像 iOS 干净 MVVM）** —— `flare-core-android-sdk` 早已暴露完整 12 模块 116 op（与 apple-sdk 1:1），故差距纯在示例 App。新建 `com.flare.im.app.core/features` 分层：`core/session/AppSession`（唯一 `FlareImClient` 持有 + 订阅 `onViewUpdated`/连接事件 + StateFlow）、`core/data/ViewDataRepository`（StateFlow 投影，**re-fetch-on-signal**：Kotlin SDK 无 snapshot/delta 解码器，故 onViewUpdated→重拉 typed 快照）、`core/data/AppEnvironment`、`core/domain/{AppModels,MessageBuilder(20 build op)}`、`core/session/AppLifecycle` + `core/FlareAppStore` 组合根、`FlareRootViewModel`。
- ✅ **5 个特性 ViewModel**：`messaging`（会话列表+时间线+全部消息/会话动作）、`sdklab`（~50 长尾探针：diagnostics/lifecycle/media×19/capabilities/presence/sync/events/builder normalize）、`search`、`auth`、`settings`。
- ✅ **Compose UI 六屏**（`features/shell/FlareApp.kt`）：Login / ConversationList / Chat+Composer / Search / Settings / SdkLab + NavigationBar，落地 `FlareTheme` 设计系统（双主题 + token，移植 iOS FlareDesign）+ i18n（`values/` en + `values-zh-rCN/` zh）。
- **覆盖 = 105/116，超过 iOS 97**（多覆盖 listConversations/IncludingArchived/openConversationTimeline/createTextMessage/getMessage/uploadBytes/subscribeEventsBatch/connect）。**11 个 `·` 与 iOS 同属等价覆盖**（`getConversation`/`getMultipleConversations`→getOne、`listConversationsByQuery`→paginated、`deleteMessage`/`markMessage`/`pinMessage`/`unmarkMessage`/`unpinMessage`→`*ById`/ForSelf-Everyone、`dispatchMessage`/`editRichDocByMessageId`→send/editText、`syncConversationSummariesWithVersions`→summaries）。
- 验证：`:app:compileDebugKotlin` + `:app:assembleDebug` **BUILD SUCCESSFUL**（JDK17）。运行时 op 执行需登录后连后端。坑（已记 app `PLAN.md`）：SDK 多数动作方法 `Map<String,Any?>`；`ForwardSourceMessage`∈content、`MediaSourceInfo`∈media、`Normalize*`/`Heartbeat*`∈command、`HeartbeatAppState`∈entity、`MessageSearchKind`∈common.enums。

### iOS(84 → 98 → 97;✅ 已可跑模拟器;2026-06-27 工程化重构 + 复核修正 `session.connect` 误标)
- ✅ **架构工程化重构(2026-06-27,能力 grep 复核无变化)** —— 不增删 SDK 操作,仅提升实现质量,使 iOS 成为干净的参考实现:① **国际化**:`Localizable.xcstrings`(en 源 + zh-Hans,232 key)落 runner→`Bundle.main`,删除手搓 `isChinese` 反模式;② **全面 MVVM**:新增 `AuthViewModel`/`SettingsViewModel`(此前 Auth/Settings 零 VM)共 5 个 VM + `Core/Session/AppLifecycle` 协议,视图层 `store.login/logout/dispose` 直调 **6→0**,仅 `RootWorkbenchView.isLoggedIn` 一处协调器路由例外;③ **平台收敛**:`Core/Platform/`(Image/Clipboard/AudioSession),`#if canImport` 从 ~50 行散落塌缩到中心化;④ **`MessageBuilder` 抽取**:payload 解析 + 消息构建迁出 `MessagingViewModel`(789→417 行);⑤ **设计 token**:`FlareDesign` 增 `Radius`/`Spacing`(4pt 网格)/`Typography` 标尺并全仓推广(cornerRadius 100% token 化)。验证:`swift build` + `swift test`(32 pass/4 skip) + `xcodebuild` iPhone 17 sim BUILD SUCCEEDED。
- ✅ **已补齐(2026-06-26,`swift build` 通过)** —— 接入 SdkLab(`FlareAppStore.runLabOperation` + `SdkLabView` 按钮):`diagnostics.getRuntimeHealth`、`session.heartbeatEffectiveInterval`、`setHeartbeatAppState`、`setHeartbeatNatTimeout`、`prepare`、`conversations.bootstrapHomeTimeline`、`messages.markMessageWithColor`、`message_builder.normalizeRichDocFrom{Markdown,Html,DocJson}`(10 项)。
- ✅ **真缺已补齐(2026-06-26,模拟器实测)** —— `connection.notifyNetworkChange`(`NetworkChangeRequest` 实有 public init → LifecycleLab「Notify network」)、`media.uploadImage/uploadVideo`(MediaLab,复用 File path 输入 → `["path": …]`)、`media.deleteFile`(MediaLab → `["fileId": …]`)。上传/删除需连后端方能真正成功;图库选择器(PhotosPicker)发图为后续 UX 增强。
- **复核为等价(非真缺)**:`pinMessage`/`unpinMessage`/`markMessage`/`unmarkMessage`(用 `*ById`)、`listConversations`(用 paginated)、`getMessage`(用 `getRawMessage`)、`getConversation`/`getMultipleConversations`(用 `getOneConversation`)、`subscribeEventsBatch`(用 `subscribeEvents`)、`openConversationTimeline`(用 `views.openTimeline`)、`createTextMessage`/`dispatchMessage`(经 send/builder)、`editRichDocByMessageId`(有 `editTextByMessageId`)、`listConversationsByQuery`/`IncludingArchived`(paginated 变体)、**`session.connect`(连接由 `client.init`+`client.login` 隐式建立,无独立 `connect()` 调用;2026-06-27 由误标 `✓` 修正为 `·`)**。
- ✅ 运行管线已修(sync_ffi + `@convention(c)` + xcodegen);iPhone 17 模拟器实测 `xcodebuild` BUILD SUCCEEDED + `simctl launch` 启动渲染。Lab 操作的运行时执行需连后端(登录后)。

### web / uni / tauri(共享 Vue,95 → 99;UI 缺口三端相同 —— 改一次三端受益)
- **2026-06-28 复核 + 补齐(共享 `packages/@flare-im/vue-ui`)**:对上一版列出的 12 个 `·` 逐个复核 →
  - **8 个本就等价覆盖(非真缺,不加冗余具名包装)**:`deleteMessageForEveryone`/`editRichDocByMessageId`/`markMessageReadAndBurn`/`markMessageWithColor`/`unmarkMessage`/`unpinMessage` 全部经 `messageDispatchOptions` 的 `dispatchMessage({op})` 覆盖;`subscribeEventsBatch`→`subscribeEvents`;`syncConversationSummariesWithVersions`→`syncConversationSummaries`。
  - **4 个真缺已补齐**(`useFlareCoreClient.runSessionOperation` + `FlareSdkLabPanel.vue` 按钮):`session.prepare`/`uninit`/`hardReset`、`messages.sendMessageNoOss`。`vue-tsc --noEmit` 0 error。→ web/uni/tauri 各 95 → **99**。
- **历史列表(已被上面复核取代)**:messages.{deleteMessageForEveryone、editRichDocByMessageId、markMessageReadAndBurn、markMessageWithColor、sendMessageNoOss、unmarkMessage、unpinMessage}、session.{prepare、uninit、hardReset}、events.subscribeEventsBatch、sync.syncConversationSummariesWithVersions。
- **平台层(各端单独补)**:web=媒体代理边界/(可选)PWA;uni=小程序兼容、原生录音/SQLite 回归;tauri=桌面通知/文件对话框/托盘等桌面原生能力 + `src-tauri` 命令面。

### Flutter(113,基准,仅 3 项)
`events.subscribeEvents`(已用 `subscribeEventsBatch` 等价)、`views.loadOlderTimeline`、`sync.syncConversationSummariesWithVersions`。基本无需补。

---

## 补齐顺序建议
1. **web/uni/tauri 的 UI 缺口**:在共享 Vue 包改一次,三端同时受益(性价比最高);先人工复核 `·` 收敛"真缺"。
2. **iOS**:✅ 运行管线已修 + 模拟器可跑;已复核等价项 + 补齐 14 项 Lab 探针(含 4 项媒体/网络真缺)。**2026-06-27 工程化重构完成**(i18n / 全面 MVVM / 平台抽象 / MessageBuilder / 设计 token),已是干净参考实现;能力补齐数值仅因复核修正 `session.connect` 误标而 98→97,无功能回归。
3. **Android**:✅ **2026-06-27 整体重写完成(21→105,超 iOS)**——干净 MVVM + Compose 六屏 + 设计系统 + i18n,`assembleDebug` 通过。不再是补齐重灾区;剩余 11 个 `·` 为等价覆盖(可选:接 PhotosPicker 真发图、富文档编辑等 UX 增强)。
4. 每补一批跑各端 parity 测试(uni 已有 `tests/uni-app-parity.test.mjs`;可为 Android/iOS 补类似断言对照本清单)。

## 附:完整矩阵(116 × 6)
图例:`✓`=操作名出现 `·`=未出现(`·` 复核等价)。**web=uni=tau 三列相同(共享 Vue)**。

| module.operation | Flu | And | iOS | web | uni | tau |
|---|:--:|:--:|:--:|:--:|:--:|:--:|
| capabilities.dispatchCapability | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| capabilities.grantCapability | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| capabilities.listCapabilities | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| capabilities.listUserCapabilities | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| capabilities.revokeCapability | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| capabilities.sendCallSignal | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| connection.disconnect | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| connection.getConnectionState | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| connection.notifyNetworkChange | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.bootstrapHomeTimeline | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.clearLocalChatHistory | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.deleteConversation | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.getConversation | ✓ | · | · | · | · | · |
| conversations.getGroupConversationByUserIds | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.getMultipleConversations | ✓ | · | · | · | · | · |
| conversations.getOneConversation | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.listConversations | ✓ | ✓ | · | ✓ | ✓ | ✓ |
| conversations.listConversationsByQuery | ✓ | · | · | ✓ | ✓ | ✓ |
| conversations.listConversationsIncludingArchived | ✓ | ✓ | · | ✓ | ✓ | ✓ |
| conversations.listConversationsPaginated | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.listRawConversations | ✓ | ✓ | ✓ | · | · | · |
| conversations.markConversationRead | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.markConversationUnread | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.openConversationTimeline | ✓ | ✓ | · | · | · | · |
| conversations.setConversationArchived | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.setConversationMuted | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.setConversationPinned | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| conversations.updateConversationDraft | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| diagnostics.getDataRoot | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| diagnostics.getFfiContractVersion | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| diagnostics.getRuntimeHealth | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| diagnostics.getSdkVersion | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| events.subscribeEvents | · | ✓ | ✓ | ✓ | ✓ | ✓ |
| events.subscribeEventsBatch | ✓ | ✓ | · | · | · | · |
| events.unsubscribe | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| events.unsubscribeAll | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.cacheRemoteMedia | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.cancelUserFileDownload | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.clearMediaCache | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.deleteFile | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.deleteUserDownloadRecord | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.downloadFileToDownloads | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.getMediaCacheStats | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.getMediaUrl | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.getTempDownloadUrl | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.getUserDownloadSavedPath | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.getUserDownloadSubfolder | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.resolveMediaAccess | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.setMediaCacheMaxBytes | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.setMediaCacheRoot | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.setUserDownloadSubfolder | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.uploadBytes | ✓ | ✓ | · | ✓ | ✓ | ✓ |
| media.uploadFile | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.uploadImage | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| media.uploadVideo | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| message_builder.listSupportedBuildOperations | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| message_builder.normalizeRichDocFromDocJson | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| message_builder.normalizeRichDocFromHtml | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| message_builder.normalizeRichDocFromMarkdown | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.addReaction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.createTextMessage | ✓ | ✓ | · | · | · | · |
| messages.deleteMessage | ✓ | · | · | ✓ | ✓ | ✓ |
| messages.deleteMessageForEveryone | ✓ | ✓ | ✓ | · | · | · |
| messages.deleteMessageForSelf | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.dispatchMessage | ✓ | · | · | ✓ | ✓ | ✓ |
| messages.editRichDocByMessageId | ✓ | · | · | · | · | · |
| messages.editTextByMessageId | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.getMessage | ✓ | ✓ | · | · | · | · |
| messages.getRawMessage | ✓ | ✓ | ✓ | · | · | · |
| messages.listMessages | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.markMessage | ✓ | · | · | ✓ | ✓ | ✓ |
| messages.markMessageById | ✓ | ✓ | ✓ | · | · | · |
| messages.markMessageReadAndBurn | ✓ | ✓ | ✓ | · | · | · |
| messages.markMessageWithColor | ✓ | ✓ | ✓ | · | · | · |
| messages.pinMessage | ✓ | · | · | ✓ | ✓ | ✓ |
| messages.pinMessageById | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.recallMessage | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.removeReaction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.searchMessages | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.searchMessagesByQuery | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.searchMessagesInConversation | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.sendMessage | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.sendMessageNoOss | ✓ | ✓ | ✓ | · | · | · |
| messages.setTyping | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| messages.unmarkMessage | ✓ | · | · | · | · | · |
| messages.unmarkMessageById | ✓ | ✓ | ✓ | · | · | · |
| messages.unpinMessage | ✓ | · | · | · | · | · |
| messages.unpinMessageById | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| presence.batchGetUserPresence | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| presence.getUserPresence | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| presence.subscribeUserPresence | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.connect | ✓ | ✓ | · | ✓ | ✓ | ✓ |
| session.create | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.currentUserId | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.dispose | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.generateCoreToken | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.hardReset | ✓ | ✓ | ✓ | · | · | · |
| session.heartbeatEffectiveInterval | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.init | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.isConnected | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.login | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.logout | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.prepare | ✓ | ✓ | ✓ | · | · | · |
| session.sessionActive | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.setHeartbeatAppState | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.setHeartbeatNatTimeout | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| session.uninit | ✓ | ✓ | ✓ | · | · | · |
| session.updateAccessToken | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| sync.syncConversation | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| sync.syncConversationSummaries | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| sync.syncConversationSummariesWithVersions | · | · | · | · | · | · |
| sync.syncMessages | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| views.close | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| views.loadOlderTimeline | · | ✓ | ✓ | ✓ | ✓ | ✓ |
| views.openConversationList | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| views.openTimeline | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
