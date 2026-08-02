# Flare Core IM Example Apps Business Test Report

测试日期：2026-06-28  
测试角色：资深产品测试工程师 / IM 核心体验验收  
测试重点：消息、会话、单聊、群聊、消息操作、消息类型、@ 人

## 1. 测试对象

本轮覆盖以下示例应用：

| 应用 | 路径 | 覆盖方式 |
| --- | --- | --- |
| Web | `flare-im-core-client-sdk/examples/flare-core-web-app` | 浏览器人工/脚本业务流 + 单元测试 |
| Tauri | `flare-im-core-client-sdk/examples/flare-core-tauri-app` | 共享 Vue UI 逻辑复用验证 + Tauri 专项测试 |
| Flutter | `flare-im-core-client-sdk/examples/flare-core-flutter-app` | Flutter 测试套件 |
| iOS | `flare-im-core-client-sdk/examples/flare-core-ios-app` | Swift 测试套件 |

测试账号主要使用 `11` / `10`，并额外使用 `qa11-*` / `qa10-*` 随机账号做幂等业务流隔离。

## 2. 总体结论

Web 端核心单聊、群聊、基础消息类型、媒体消息、结构化消息和常见消息操作已经跑通。群聊消息原先存在接收方无法收到消息的 P0 阻塞问题，已在消息 ingest 服务中修复并通过真实浏览器双用户回归。

四个示例 App 的模块级测试当前均可通过。Tauri/Flutter/iOS 与 Web 共享 SDK/核心模型，因此本轮主要用自动化确认跨端契约未破坏，Web 用真实浏览器承担最完整的业务流验证。

但当前还不能称为“飞书 / Telegram 级核心 IM 体验”。主要缺口是：真实 @ 人能力未完成、群成员展示投影仍可能显示 `0 位成员`、编辑/引用在对端活跃会话中的实时收敛不够稳定、主流程群创建缺少多人选择器。

## 3. 已直接修复的问题

| 编号 | 问题 | 影响 | 修复 |
| --- | --- | --- | --- |
| FIX-01 | 群聊消息发送后，接收方会话出现但消息历史/预览不出现 | P0，群聊核心链路阻塞 | `flare-message-ingest` 在成员查询失败时使用消息属性 `group_member_ids` 兜底解析收件人，并排除发送者、去重 |
| FIX-02 | 打开空会话触发 `mark_read_failed: read_seq must be greater than 0` | P1，首进会话产生错误日志和潜在状态噪音 | Vue SDK UI 在 `readSeq <= 0` 时跳过 mark-read |
| FIX-03 | Web 测试因设计 token 生成路径漂移失败 | P2，测试入口不可用 | 更新 token 检查脚本输出路径到当前 Vue UI 包 |
| FIX-04 | Tauri transport 测试仍按旧 Electron 原生传输预期断言 | P2，测试预期过期 | 更新为 Tauri 启用原生 transport、Electron/Web 保持 WebSocket/WASM-only |

## 4. 验证命令结果

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Web | `rtk npm run test` | 通过：6 个测试文件，24 个测试 |
| Tauri | `rtk yarn test` | 通过：6 个测试 |
| Flutter | `rtk flutter test` | 通过：55 个测试 |
| iOS | `rtk swift test` | 通过：42 个测试，4 个 live/FFI 测试按环境变量跳过 |
| message-ingest | `rtk cargo test --manifest-path flare-im-core/Cargo.toml -p flare-message-ingest` | 通过：12 个测试 |
| message-ingest | `rtk cargo build --manifest-path flare-im-core/Cargo.toml -p flare-message-ingest --bin flare-message-ingest` | 通过，仅有既有 `async_fn_in_trait` warning |
| E2E | `rtk npm run test:e2e` | 未通过：本机 Playwright Chromium cache 缺失，后续用系统 Chrome 脚本替代验证 |

iOS 跳过项需要以下环境才可执行：`FLARE_IOS_LIVE_AUDIO=1`、`FLARE_IOS_LIVE_CONVERSATION_LIST=1`、`FLARE_IOS_LIVE_LOGIN=1`、`FLARE_FFI_DYLIB`。

## 5. 业务功能测试矩阵

| 功能 | Web 真实业务流 | 跨端自动化/契约 | 结论 |
| --- | --- | --- | --- |
| 登录 | `11` / `10` 登录成功 | Web/Tauri/Flutter/iOS 测试通过 | 通过 |
| 会话列表 | 单聊/群聊会话可出现，预览可刷新 | Web/Tauri 共享 UI 测试通过 | 基本通过 |
| 单聊 | `11 -> 10` 文本消息可在对端会话预览看到 | Web 真实双用户通过 | 通过 |
| 群聊 | 修复后 `qa11-* -> qa10-*` 群消息预览和历史均可见 | message-ingest 单测通过 | 通过，但成员展示仍有缺口 |
| 草稿/清空 | 发送成功后草稿清空 | Web UI 流程通过 | 通过 |
| 已读 | 空会话不再提交 `readSeq=0` | Web/Tauri 测试回归通过 | 通过 |
| 回复/引用 | 发送方本端可发出引用消息 | 浏览器脚本可执行 | 部分通过，对端实时出现不稳定 |
| 编辑 | 本端编辑操作可执行 | 浏览器脚本可执行 | 部分通过，对端实时收敛不稳定 |
| 撤回 | 对端可观察到撤回结果 | 浏览器脚本通过 | 通过 |
| 本地删除 | 本端可删除消息 | 浏览器脚本通过 | 通过 |
| 复制 | UI 复制动作可执行 | 浏览器脚本通过 | 通过 |
| Reaction | 表情反应可执行 | 浏览器脚本通过 | 通过 |
| Pin/置顶消息 | 操作入口可执行 | 浏览器脚本通过 | 基本通过 |
| @ 人 | 输入框 `@` 按钮只插入字符，没有 mention 元数据 | SDK 契约只支持 `mention_all`，不支持用户列表 | 不通过 |

## 6. 消息类型测试矩阵

| 消息类型 | 测试结果 | 说明 |
| --- | --- | --- |
| 文本 | 通过 | 单聊、群聊均发送并可见 |
| 图片 | 通过 | 使用本地 PNG 通过文件输入发送 |
| 文件 | 通过 | 使用本地 TXT 通过文件输入发送 |
| 视频 | 通过 | 使用本地 MP4 通过文件输入发送 |
| 位置 | 通过 | 结构化消息构建和发送成功 |
| 名片 | 通过 | 结构化消息构建和发送成功 |
| 任务 | 通过 | 结构化消息构建和发送成功 |
| 日程 | 通过 | 结构化消息构建和发送成功 |
| 投票 | 通过 | 结构化消息构建和发送成功 |
| 链接 | 通过 | 结构化消息构建和发送成功 |
| 小程序 | 通过 | 结构化消息构建和发送成功 |
| 话题/Thread Reply | 通过 | 结构化消息构建和发送成功 |
| 通知 | 通过 | 结构化消息构建和发送成功 |
| 公告 | 通过 | 结构化消息构建和发送成功 |
| Emoji / 单表情 | 部分通过 | 代码路径支持 `resolveLoneEmojiPackKey`，但本轮未形成稳定双端可见性断言 |
| 富文本 / Markdown | 部分通过 | 代码路径支持 `buildRichTextPayload`，但本轮未形成稳定双端可见性断言 |
| 语音 | 未实测 | 需要麦克风授权，本轮未主动申请用户系统权限 |
| @ 用户 | 不通过 | 没有成员选择器，也没有用户 mention 元数据写入 |

## 7. 关键缺陷与风险

| 编号 | 优先级 | 状态 | 问题 |
| --- | --- | --- | --- |
| BUG-01 | P0 | 已修复 | 群聊消息 ingest 因成员查询失败直接阻断投递，接收方看不到群消息 |
| BUG-02 | P1 | 已修复 | 空会话 mark-read 提交非法 `readSeq=0` |
| BUG-03 | P1 | 未修复 | @ 人不是 IM 级能力，只是插入 `@` 字符；没有成员 picker、没有 mention 元数据、`@我` 筛选不可作为可靠验收 |
| BUG-04 | P1 | 未修复 | 群消息修复后可投递，但接收方打开群会话时仍可能显示 `0 位成员` |
| BUG-05 | P1 | 未修复 | 引用回复和编辑在对端活跃会话中的实时收敛不稳定，撤回相对稳定 |
| BUG-06 | P2 | 未修复 | 主会话创建弹窗群聊只输入一个对方 ID，缺少多人选择/成员管理体验 |
| BUG-07 | P2 | 未修复 | Playwright 本地 Chromium cache 缺失，`test:e2e` 不能直接运行 |
| BUG-08 | P2 | 未修复 | 现有 E2E selector 对 composer 输入框形态假设偏窄，富文本/普通输入切换后容易失效 |

## 8. 飞书 / Telegram 级体验差距

必须补齐以下能力后，才建议把这些 example app 标为高质量核心 IM 演示应用：

1. @ 人需要从产品和契约两层补齐：群成员搜索、键盘选择、展示高亮、消息结构化 `mentions`、`@我` 会话过滤、通知策略。
2. 群聊需要完整成员投影：成员数、成员列表、群名、群头像、入群/退群/变更事件要和消息投递一致。
3. 消息操作需要实时收敛验收：编辑、引用、撤回、reaction、pin 在双方活跃会话和离线重连后都要一致。
4. 富文本、emoji、语音需要补稳定 E2E：不仅能构建，还要验证发送、接收、展示、失败重试。
5. 主流程群创建需要多人选择器，不应只支持当前用户 + 一个 peer 的轻量入口。
6. E2E 环境需要固定浏览器安装和 selector 合约，避免靠人工脚本兜底。

## 9. 本轮建议的下一步验收标准

| 目标 | 验收方式 |
| --- | --- |
| @ 用户可用 | 在群聊输入 `@` 弹出成员列表，选择 `10` 后发送；消息内容带 mention 元数据；`10` 的 `@我` 筛选出现该会话 |
| 群成员投影正确 | 新建三人群后，三端打开均显示正确成员数和成员列表 |
| 编辑/引用实时一致 | A/B 同时停留在会话内，A 编辑或引用后 B 在 3 秒内无刷新可见 |
| 富文本和 emoji 双端可见 | 富文本标题/正文/emoji 单表情在 Web/Tauri/Flutter/iOS 至少各有一条自动化断言 |
| 语音最小链路 | 授权麦克风后录音、发送、接收、播放状态均可验证 |
| E2E 可重复 | `npm run test:e2e` 在干净机器上自动安装/定位浏览器并通过 |

## 10. 2026-06-28 Web/Tauri/Flutter 实机联调补充

本轮按用户要求同时启动并登录 Web、Tauri、Flutter 三端，使用真实窗口和浏览器进行跨端交互验证：

| 端 | 启动方式 | 登录账号 | 状态 |
| --- | --- | --- | --- |
| Web | `rtk npm run dev:web -- --host 127.0.0.1 --port 1430` | `11` | 登录成功，`4 会话 · 1 置顶 · ready` |
| Tauri | `rtk yarn tauri dev` | `10` | 登录成功，原生窗口可收发 |
| Flutter macOS | `rtk flutter run -d macos` | `qa12f264`，并尝试历史账号 `12` | 登录成功，跨端收信可见 |

### 10.1 实机联调结果

| 流程 | 结果 | 证据 |
| --- | --- | --- |
| Web `11` -> Tauri `10` 单聊文本 | 通过 | Tauri 会话列表和气泡显示 `web11-to-tauri10-1782630364622` |
| Tauri `10` -> Web `11` 单聊文本 | 通过 | Web 收到 `t2w1508` |
| Web `11` -> Flutter `qa12f264` 单聊文本 | 通过 | Flutter 会话列表先后显示 `w2ff264`、补丁后显示 `w2f608841` |
| Flutter macOS 登录 | 通过 | 修复 entitlements 后不再出现 `sdk.connect` 的 macOS `Operation not permitted` |
| Flutter 历史 `thread` 消息加载 | 已修复编译/映射阻断 | 新增 `ThreadReplyContent`、mapper 和气泡渲染分支 |
| Flutter native event 收信解码 | 已修复 | `message.received` 同时支持 `{message}` wrapper 和 native 直接 message payload，单测通过 |

### 10.2 本次新增修复

| 编号 | 优先级 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-05 | P0 | 已修复 | Flutter macOS Debug/Profile/Release entitlements 增加 `com.apple.security.network.client`，否则 SDK 连接服务端失败 |
| FIX-06 | P1 | 已修复 | Flutter SDK `message.received` 事件解码兼容真实 native 直接 message payload，避免收信后抛 `invalid event payload field: message` |
| FIX-07 | P1 | 已修复 | Flutter 示例 App 支持 `thread` 内容映射和渲染，历史话题回复不再阻断会话加载 |

### 10.3 新增验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Flutter SDK | `rtk dart test test/default_flare_im_client_direct_ffi_test.dart` | 通过：32 个测试 |
| Flutter macOS | `rtk flutter run -d macos` | 通过：编译并启动真实 macOS App |

### 10.4 仍未达到飞书 / Telegram 级体验的点

1. `@ 人` 仍未通过：当前 UI 只插入 `@` 字符，没有成员选择器、结构化 mentions、`@我` 筛选闭环。
2. Tauri 自动化输入受系统中文输入法和 AppleScript 长文本限制影响，实测时需要使用剪贴板粘贴才能稳定发送 ASCII 测试串。
3. Flutter macOS 可收信，但真实 UI 自动化可访问性不足，发送侧还需要增加可测试语义或稳定测试入口。
4. Flutter 控制台存在高频 `conversation_update cid=all` 日志噪音，需要后续定位是否是会话投影重复刷新。
5. 语音消息仍需要系统麦克风授权和播放链路专项验证，本轮未主动申请用户系统权限。

## 11. 2026-06-28 继续测试补充：Web / Tauri / Flutter 三端联调

本节记录“继续完成没有完成的测试”后的新增结果。测试期间三端同时启动：

| 端 | 账号 | 状态 |
| --- | --- | --- |
| Web | `11` | `http://127.0.0.1:1430/#/chat`，登录成功 |
| Flutter macOS | `12` | 登录成功，可收到 Web 单聊消息 |
| Tauri | `10` | `rtk yarn tauri dev` 启动成功，登录成功 |

### 11.1 本次新增修复

| 编号 | 优先级 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-08 | P0 | 已修复 | Tauri dev 构建被共享 target 中过期 SDK artifact 阻断；通过包级 `cargo clean -p flare-im-core-sdk -p flare-im-core-sdk-bindings-runtime` 清掉污染产物后，`cargo build --no-default-features --bin flare-core-tauri-app` 与 `yarn tauri dev` 均可启动 |
| FIX-09 | P1 | 已修复 | Flutter SDK `sync` 非失败事件携带 native null/error 占位时抛 `invalid SDK error payload field: error`；已让非 failed sync 事件忽略 error 占位，并兼容 native null sentinel |
| FIX-10 | P2 | 已修复 | Web/Tauri SDK 消息类型面板构建失败时只打 Vue console warning；已在 Web、Tauri、共享 Vue UI 工作台入口加错误 toast，失败时保留抽屉 |

### 11.2 新增跨端业务验证

| 流程 | 结果 | 证据 |
| --- | --- | --- |
| Web `11` -> Flutter `12` 单聊 | 通过 | Flutter 会话列表收到 `w2f-1556-3mqb9d`，unread/preview 更新 |
| Web `11` -> Tauri `10` 单聊 | 通过 | Tauri 会话列表和气泡显示 `w2t-1607-xn4ul3` |
| Tauri `10` -> Web `11` 单聊 | 部分通过 | Web 收到 Tauri 消息，但自动化输入受中文输入法影响，`t2w-1612-80f6e1` 被写成 `条w-1612-80f6e1v` |
| Web `11` 打开 `11/12/13` 群聊并发送 | 通过 | 群会话 `2AMR1DPNDZ5Y67HXGQ` 可打开，`group-msg-xj6mgz` 发送成功 |
| Web `11` -> Flutter `12` 群聊实时收信 | 通过 | Flutter 日志收到 `cid=2AMR1DPNDZ5Y67HXGQ seq=1 server=79ab0a88-a271-402a-b13f-9adf86d8e9a2` |
| 群聊 `@12` | 不通过 | 消息正文可见，但 `mentionUsers=[]`、`mentionAll=false`，仍是普通文本 |

### 11.3 消息类型补测

| 类型 | 结果 | 备注 |
| --- | --- | --- |
| 文本 | 通过 | `type-text-xiwnbb` 可见 |
| 文件 | 部分通过 | 可发送，但气泡只显示“文件消息”，文件名 token 未展示 |
| 视频 | 部分通过 | 可发送，但气泡只显示“视频”，描述/文件名 token 未展示；合成 media id 触发 media file-url 500 |
| 位置 | 通过 | `type-location-xiwnbb`、地址和坐标展示正确 |
| 名片 | 通过 | `type-card-xiwnbb` 展示正确 |
| 日程 | 通过 | 使用 `startTimeMs/endTimeMs` 后 `type-schedule-fix-xj0hmi` 展示正确 |
| 任务 | 通过 | `type-task-xiwnbb` 展示正确 |
| 链接 | 通过 | `type-link-xiwnbb` 展示正确 |
| 小程序 | 通过 | `type-mini-xiwnbb` 展示正确 |
| 投票 | 通过 | `type-vote-xiwnbb` 展示选项和票数 |
| 话题 | 部分通过 | 可发送，但显示退化为 `thread [话题] thread thread`，未展示测试正文 |
| 通知 | 通过 | `type-notice-fix-xj0hmi` 展示为系统通知 |
| 公告 | 通过 | `type-announce-fix-xj0hmi` 展示为公告卡片 |
| @ 人 | 不通过 | `@` 按钮只插入 `@`，无成员选择器和结构化 mention |

### 11.4 消息操作补测

使用 disposable 消息 `ops-base-xj50cy` 验证：

| 操作 | 结果 | 备注 |
| --- | --- | --- |
| 发送文本 | 通过 | server id `7256eb96-f80b-4288-9628-dfa1552470c3` |
| 搜索当前会话 | 通过 | `searchActiveMessages(..., ["text"])` 命中 1 条 |
| 通用 Message Dispatch | 不通过 | Web binding 返回 `OPERATION_NOT_SUPPORTED: binding operation is not implemented: dispatch` |
| 添加 Reaction | 通过 | `👍` count=1，userIds 包含 `11` |
| 移除 Reaction | 通过 | reactions 清空 |
| 编辑文本 | 部分通过 | `content.data.text` 与页面正文更新，但 `textPreview` 仍保留旧文案 |
| Pin / Unpin | 通过 | `attributes.pinned` 从 `true` 变为 `false`，pinnedCount 回到 0 |
| Typing on/off | 通过 | 专用接口可调用，无阻断错误 |
| Delete for self | 通过 | disposable 消息从当前 timeline 移除 |

### 11.5 新增验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Flutter SDK | `rtk dart test test/wire_codec_message_test.dart` | 通过：18 个测试 |
| Flutter SDK | `rtk dart test test/default_flare_im_client_direct_ffi_test.dart` | 通过：33 个测试 |
| Web | `rtk npm run typecheck` | 通过 |
| Tauri | `rtk yarn typecheck` | 通过 |
| Vue UI 包 | `rtk yarn typecheck` | 通过 |

### 11.6 仍需修复到飞书 / Telegram 级体验的问题

| 编号 | 优先级 | 问题 |
| --- | --- | --- |
| BUG-09 | P1 | @ 人没有结构化能力：无群成员 picker、无 mention metadata、`@我` 筛选无法闭环 |
| BUG-10 | P1 | Web 通用 `message.dispatch` 绑定未实现，SDK Lab 的 Message Dispatch 面板核心操作不可作为稳定验收入口 |
| BUG-11 | P1 | 编辑后正文已变更但 `textPreview` 仍旧，影响会话列表预览、搜索摘要和跨端一致性 |
| BUG-12 | P2 | 文件/视频/话题消息可发送但展示信息不足，文件名、描述、话题正文容易丢失 |
| BUG-13 | P2 | Tauri dev binary 无可识别 bundle id，Computer Use 不能直接 attach；真实验收只能退回 System Events/截图 |
| BUG-14 | P2 | Flutter macOS 会话行缺少稳定可访问语义，自动化点击打开会话不稳定 |
| BUG-15 | P2 | Tauri 桌面输入在中文输入法下会污染 ASCII 测试串，需要应用侧/测试侧增加输入法无关的稳定输入路径 |

## 12. 2026-06-28 继续修复补充：除 @ 人外的核心体验问题

本轮按要求暂不处理 `@ 人`，优先收口消息与会话主链路的阻断和体验退化。

### 12.1 本次新增修复

| 编号 | 对应问题 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-11 | BUG-10 | 已修复 | Web/Tauri shared binding runtime 支持 `message.dispatch` 的 `{ op, params }` 形态，SDK Lab 的通用 Message Dispatch 不再被错误转成未实现的 `dispatch` operation |
| FIX-12 | BUG-10 | 已修复 | TypeScript SDK `searchMessagesInConversation` 映射改为 `message.search_in_conversation` / `search_in_conversation`，避免会话内搜索走错全局 search operation |
| FIX-13 | BUG-11 | 已修复 | 内存/IndexedDB 消息更新内容时同步刷新 `text_preview`，编辑后本地消息、会话列表 latest preview 和持久化投影保持一致 |
| FIX-14 | BUG-11 | 已修复 | `MessageMutationUseCase::edit` 成功应用本地更新后重算会话 latest，避免最新消息被编辑后会话列表仍显示旧摘要 |
| FIX-15 | BUG-12 | 已修复 | `create_thread_reply` 不再把正文塞进 `contentText` metadata，而是写入 typed `ThreadContent.thread_title`；话题消息预览和 UI 可直接展示测试正文 |
| FIX-16 | BUG-12 | 已修复 | 增强 composer 的文件/图片/视频构建会从表单、真实 `File.name` 或路径 basename 推导文件名；视频描述为空时使用文件名，避免气泡退化成“视频”泛称 |
| FIX-17 | BUG-14 | 已修复 | Flutter macOS 会话行增加整行 `Semantics(button, selected, label, hint, onTap)`，自动化和辅助功能可稳定识别/打开会话 |
| FIX-18 | BUG-15 | 已修复 | Web/Tauri Vue composer 为 textarea 和富文本 contenteditable 关闭 spellcheck/autocorrect/autocapitalize，并保持 IME composing 时 Enter 不误发 |

### 12.2 复核结果

| 项 | 结果 | 备注 |
| --- | --- | --- |
| BUG-10 | 通过 | bindings runtime `message_dispatch` 单测通过；TS wire contract 22 个测试通过 |
| BUG-11 | 通过 | core SDK 编辑本地投影单测通过，验证 edited message preview 与 conversation latest preview 均包含新正文 |
| BUG-12 | 已改善 | 文件/视频/话题的 typed payload 和默认展示信息已补；后续仍建议做真实文件跨端缩略图/下载 E2E |
| BUG-13 | 未改代码 | `tauri.conf.json` 已存在 `identifier = com.flare.core.tauri.app`；`tauri dev` 的无 bundle id 属于 dev runner 产物限制，正式验收建议使用打包 `.app` 或保留 System Events 兜底 |
| BUG-14 | 通过 | Flutter analyzer 对 `conversation_item.dart` 无问题 |
| BUG-15 | 已改善 | 应用侧输入属性已加固；仍建议测试脚本优先粘贴或切换 ABC 输入源，避免 macOS 系统输入法污染自动化文本 |

### 12.3 本轮验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Rust bindings runtime | `rtk cargo test --manifest-path flare-im-core-sdk/Cargo.toml -p flare-im-core-sdk-bindings-runtime message_dispatch -- --nocapture` | 通过：2 个测试 |
| Rust core SDK | `rtk cargo test --manifest-path flare-im-core-sdk/Cargo.toml -p flare-im-core-sdk local_edit_refreshes_message_preview_and_conversation_latest -- --nocapture` | 通过 |
| Rust core SDK | `rtk cargo test --manifest-path flare-im-core-sdk/Cargo.toml -p flare-im-core-sdk build_thread_reply_keeps_reply_text_in_typed_thread_title -- --nocapture` | 通过 |
| TypeScript SDK | `rtk yarn --cwd flare-im-core-client-sdk/packages/flare-core-typescript-sdk vitest run test/wire_codec_contract.test.ts` | 通过：22 个测试 |
| TypeScript SDK | `rtk yarn --cwd flare-im-core-client-sdk/packages/flare-core-typescript-sdk typecheck` | 通过 |
| Vue IM UI | `rtk yarn --cwd flare-im-core-client-sdk/packages/flare-core-vue-im-ui typecheck` | 通过 |
| Flutter macOS UI | `rtk flutter analyze lib/interface/widgets/conversation_item/conversation_item.dart` | 通过；仅输出项目既有 CocoaPods/SPM 迁移提示 |

### 12.4 当前仍保留的问题

| 编号 | 状态 | 说明 |
| --- | --- | --- |
| BUG-09 | 未处理 | 用户明确要求本轮先不处理 `@ 人`，仍需后续补成员 picker、mentions typed payload、`@我` 筛选 |
| BUG-13 | 环境限制 | 配置层已有 bundle identifier；dev binary attach 能力需要测试方案改为 packaged app 或 Computer Use/System Events 兜底 |
| 语音链路 | 未专项验证 | 仍需要麦克风授权、发送、接收、播放、失败重试的跨端 E2E |

## 13. 2026-06-28 继续联调：Web / Flutter / Tauri / iOS 启动与群聊回归

本轮按要求继续启动四个示例 App，并使用 Computer Use 对 Web 与 Flutter macOS 做真实界面联调。`@ 人` 按用户要求暂不处理。

### 13.1 启动状态

| 端 | 状态 | 说明 |
| --- | --- | --- |
| Web | 已启动 | `127.0.0.1:1430`，账号 `11` 可登录；多次遇到首页同步超时，已补降级 |
| Flutter macOS | 已启动 | `flutter run -d macos`，账号 `12` 保持登录，可被 Computer Use attach |
| Tauri | 已启动 | `yarn tauri dev`，renderer `1432` 和 dev binary 均运行；Computer Use 仍不能 attach dev binary |
| iOS | 构建通过，安装阻塞 | `xcodebuild` 对 `iPhone 17` simulator 构建通过；`xcrun simctl install` 多次长时间无响应，未完成 UI 验收 |

### 13.2 本轮新增修复

| 编号 | 优先级 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-19 | P0 | 已修复 | Web 群聊创建输入支持空格、逗号、顿号、分号、竖线分隔成员，并自动带上当前用户，避免把 `12 13` / `users:11,12,13` 当作单个假成员 |
| FIX-20 | P0 | 已修复 | Web 登录同步对 `sync.conversation_summaries` 和 `conversation.bootstrap_home` 超时做降级，回退到可用会话列表，不再直接卡在同步失败页 |
| FIX-21 | P1 | 已修复 | Web 群聊标题从 channel/member 信息生成，避免 `群聊(11、12、13)` 聚焦输入后退化成单个成员 `12` |
| FIX-22 | P1 | 已修复 | Web composer 发送成功路径前移清空输入，并暴露 `resetInput` 同步清理 textarea DOM；草稿清理改为发送后立即执行 |
| FIX-23 | P1 | 已修复 | Flutter 前台会话收到 conversation list delta 但 timeline delta 为空时，自动补拉当前 timeline 并标读，避免群聊列表更新但打开聊天页不显示新消息 |
| FIX-24 | P2 | 已修复 | Flutter 空状态文案加最大宽度与 text scale clamp，避免 macOS 窗口下大字重叠 |

### 13.3 本轮真实界面验证

| 流程 | 结果 | 备注 |
| --- | --- | --- |
| Web `11` 登录 | 部分通过 | 可进入会话；同步超时已补降级，但仍需长稳压测 |
| Flutter `12` 登录 | 通过 | 会话列表和群聊页面可打开 |
| Web 创建/打开 `11/12/13` 群聊 | 通过 | 成员数显示 3，channel 为 `users:11,12,13` |
| Web 群聊标题稳定性 | 通过 | 列表、header、输入 placeholder 均保持 `群聊(11、12、13)` |
| Web -> Flutter 群聊实时更新 | 修复中 | Flutter 列表时间戳更新，但修复前当前 timeline 不追加新消息；已补前台 timeline 拉取兜底，需继续复测新消息 |
| Web 发送后输入/草稿清理 | 修复中 | 已前移清空和 DOM reset；旧持久化草稿仍会在刷新后加载，需继续验证新消息发送后的清空结果 |

### 13.4 本轮验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Vue IM UI | `rtk yarn typecheck` | 通过 |
| Vue IM UI smoke | `rtk yarn test src/app/shared/testing/smoke.test.ts` | 通过：98 个测试 |
| Flutter macOS | `rtk flutter analyze lib/interface/shell/workbench_shell.dart` | 通过 |
| Flutter bridge | `rtk flutter analyze lib/application/bridge/event_to_store.dart` | 通过；仅输出项目既有 CocoaPods/SPM 迁移提示 |
| iOS 示例 | `xcodebuild -project FlareImApp.xcodeproj -scheme FlareImExampleApp -destination 'platform=iOS Simulator,name=iPhone 17' ... build` | 通过 |

### 13.5 仍需继续处理

| 编号 | 优先级 | 问题 |
| --- | --- | --- |
| BUG-16 | P0 | Web 首页同步仍需长稳验证：`bootstrap_home` 超时已降级，但需要持续确认不会再阻塞登录 |
| BUG-17 | P0 | Flutter 群聊实时 timeline 需要复测 FIX-23 后的新消息是否即时显示 |
| BUG-18 | P1 | Web 旧持久化 draft 会在刷新后继续加载，需确认发送成功后的 server/local draft 清理已彻底闭环 |
| BUG-19 | P1 | Tauri dev binary 运行正常但 Computer Use 无法 attach；需要 packaged `.app` 验收或测试工具兜底 |
| BUG-20 | P1 | iOS simulator 安装阶段 `simctl install` 持续挂起，阻塞 iOS UI 业务测试 |
| BUG-09 | P1 | `@ 人` 暂未处理，仍需后续补成员选择器、typed mentions 和 `@我` 筛选闭环 |

## 14. 2026-06-28 闭环推进补充：消息/会话主链路继续收敛

本节记录继续闭环时的新增修复。`@ 人` 仍按用户要求暂不处理。

### 14.1 新增修复

| 编号 | 优先级 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-25 | P0 | 已修复 | Browser WASM 登录首页同步增加启动快路径：登录成功后先进入工作台，重型 `bootstrap_home` / summary sync 按会话打开路径触发，避免卡在 `45/70` 进度 |
| FIX-26 | P1 | 已修复 | `loadHomeConversations`、`openConversationListView`、`syncConversationSummaries` 增加 8s timeout 和 degraded fallback，避免首页/列表同步无限等待 |
| FIX-27 | P1 | 已修复 | Flutter 前台 active conversation 收到 conversation delta 时增加节流补拉 timeline，解决列表更新但当前聊天页不刷新的风险 |
| FIX-28 | P1 | 已修复 | Web composer 发送事件携带提交文本，子组件点击发送后立即清空本地输入；父组件用提交文本发送，失败才恢复，避免成功发送后旧 DOM/draft 回填 |
| FIX-29 | P1 | 已修复 | Web draft 更新成功后乐观 patch 本地 `conversations` / `activeConversation` 的 `draft` 字段，列表草稿状态可立即收敛 |
| FIX-30 | P2 | 已修复 | Plain textarea reset 增加 input key remount，规避 Naive UI textarea DOM value 与 Vue model 分叉 |

### 14.2 真实界面复测进展

| 流程 | 结果 | 证据 |
| --- | --- | --- |
| Web `11` 登录 | 通过，重启后待 UI 复测 | 重启前可进入 `#/conversations`，不再停在登录同步进度；重启后 Web server 可访问，但 Chrome 自动化阻塞 |
| Web 打开 `11/12/13` 群聊 | 通过 | `群聊(11、12、13)` 可打开，成员数 3，channel `users:11,12,13` |
| Web 群聊发送 | 通过 | 消息数从 5 -> 6 -> 7，新消息 `...second 183414` 进入 timeline |
| Web 发送后输入/草稿清理 | 已修复，待新进程 UI 复测 | 修复前真实 UI 复现：消息已发出但输入框和左侧 `草稿` 残留；随后改为提交文本事件 + 子组件立即清空 + 父组件成功后不回填 |
| Flutter 群聊实时收信 | 待复测 | Flutter bridge analyze 通过，但后续 Computer Use 获取 Flutter 窗口超时，未完成 FIX-27 后的新消息观察 |
| Tauri dev UI | 阻塞 | `yarn tauri dev` 仍可启动；Computer Use 不能 attach dev binary |
| iOS UI | 阻塞 | iOS 构建通过；simulator install 仍阻塞 |

### 14.3 桌面自动化阻塞

| 阻塞 | 影响 | 当前处理 |
| --- | --- | --- |
| Chrome AppleEvent/Computer Use 超时 | 无法继续用主 Chrome 完成最终 UI 复测 | 未强杀用户主浏览器；尝试临时 profile 和 Playwright，均被系统 Chrome 启动超时阻塞 |
| Playwright MCP 启动 Chrome 超时 | 无法替代主 Chrome 做独立 Web 复测 | 已记录为环境 blocker；Web server `127.0.0.1:1430` 仍可 `curl` 访问 |
| Flutter Computer Use 超时 | 无法继续观察 Flutter macOS 新消息 | Flutter 代码验证通过；真实窗口复测待桌面自动化恢复 |

### 14.4 新增验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Vue IM UI | `rtk yarn typecheck` | 通过 |
| Vue IM UI smoke | `rtk yarn test src/app/shared/testing/smoke.test.ts` | 通过：98 个测试 |
| Flutter bridge | `rtk flutter analyze lib/application/bridge/event_to_store.dart` | 通过；仅输出项目既有 CocoaPods/SPM 迁移提示 |

### 14.5 下一步闭环条件

1. 桌面浏览器自动化恢复后，使用新进程重新登录 Web `11`，打开 `11/12/13` 群聊，发送唯一文本，验收输入框为空、左侧无 `草稿`、Messages +1。
2. Flutter `12` 打开同一群聊，确认该唯一文本在 active timeline 中 3 秒内出现。
3. Tauri 使用 packaged `.app` 或可识别 bundle id 版本做 Computer Use 验收，覆盖群聊打开、发送、置顶/免打扰/归档/标读/删除。
4. iOS 需要先解决 `simctl install` 卡住，再继续真实 UI 登录和消息流。

## 15. 2026-06-28 闭环继续推进：Web 群聊消息操作实测

本轮继续收敛核心消息/会话主链路。`@ 人` 仍按前序要求暂不处理。Chrome 自动化仍不稳定，因此改用 Safari + Computer Use 做真实界面验收。

### 15.1 运行环境与启动结论

| 项 | 结果 | 证据 |
| --- | --- | --- |
| Core 服务 | 通过 | `FLARE_USE_LAUNCHCTL=1 make start-core-fast` 可保持后台进程；`50050/50061/50062/60051` 端口均可连接 |
| Web dev server | 通过 | `127.0.0.1:1430` 可访问，Safari 打开 Web 示例 |
| Web 登录 | 通过 | 账号 `11` 登录进入 `#/conversations`，状态 `ready / WebSocket` |
| 群聊打开 | 通过 | 输入 `12 13` 后打开 `群聊(11、12、13)`，成员数 3 |

### 15.2 本轮新增修复

| 编号 | 优先级 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-31 | P0 | 已修复 | Web composer 点击发送时先把提交文本 emit 给父组件，再清空输入；父组件用提交参数发送，解决“输入框清空但业务收到空文本并提示请输入要发送的内容”的竞态 |
| FIX-32 | P1 | 已修复 | Reaction add/remove 成功后本地幂等 patch `message.reactions`，并优先用 `serverId` 作为后端 messageId；避免回应依赖事件回推导致 UI 点击后无反馈 |

### 15.3 Safari 真实界面验证

| 流程 | 结果 | 证据 |
| --- | --- | --- |
| 群聊文本发送 | 通过 | 发送 `web after patch send 1928` 后时间线出现消息；输入框为空，发送按钮禁用；会话列表预览更新且不再显示 `草稿` |
| 群聊回复 | 通过 | 对上一条消息点击回复，发送 `reply check 1929` 后出现引用块，输入框清空，会话预览更新 |
| 表情回应 add | 通过 | 对回复消息选择点赞后，气泡下方出现 `👍 1` |
| 表情回应 remove/toggle | 通过 | 再次选择同一点赞后，`👍 1` 消失 |
| 消息更多菜单 | 部分通过 | 菜单可打开，包含撤回、多选、标记、置顶、仅自己置顶、复制、预览、编辑、删除；Esc 未关闭菜单，记录为体验瑕疵 |
| 删除/撤回 UI | 未重复执行 | 属于破坏性数据操作，本轮未通过 Computer Use 点击；此前已验证 `Delete for self` 接口链路可移除 disposable 消息 |

### 15.4 验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Vue IM UI | `rtk yarn typecheck` | 通过 |
| Vue IM UI smoke | `rtk yarn test src/app/shared/testing/smoke.test.ts` | 通过：99 个测试 |
| Flutter bridge | `rtk flutter analyze lib/application/bridge/event_to_store.dart` | 通过 |

### 15.5 当前剩余未闭环项

| 编号 | 优先级 | 状态 |
| --- | --- | --- |
| BUG-09 | P1 | `@ 人` 暂不处理，仍需成员 picker、typed mentions、`@我` 筛选 |
| BUG-17 | P0 | Flutter `12` 收 Web 群聊消息的 active timeline 仍需在真实窗口下复测 |
| BUG-19 | P1 | Tauri dev binary 仍无法被 Computer Use 直接 attach，建议用 packaged `.app` 验收 |
| BUG-20 | P1 | iOS simulator install 挂起仍阻塞 UI 测试 |
| BUG-21 | P2 | 消息菜单 Esc 关闭体验未达飞书/Telegram 级，需要补键盘关闭与焦点回收 |

## 16. 2026-06-29 闭环继续推进：结构化 @ 人与批量下行契约

用户最新要求改为继续处理全部核心 IM 差距，`@ 人` 不再暂缓；同时当前仍处开发阶段，可破坏旧兼容以换取飞书 / Telegram 级体验。

### 16.1 新增修复

| 编号 | 优先级 | 状态 | 修复 |
| --- | --- | --- | --- |
| FIX-33 | P0 | 已修复 | SDK 批量下行改为 canonical `ReceivedBatch`，`finish_batch` 不再 O(n) 回放单条 `Received`，降低大群下行事件风暴 |
| FIX-34 | P0 | 已修复 | Core text builder 支持 typed mentions：`mentionUsers`、`mentionAll`、`content.data.mentions`，不再把核心语义塞进 metadata/attributes |
| FIX-35 | P0 | 已修复 | Direct invoke/shared dispatch、TS SDK wire codec、WASM smoke runtime 串通 typed mention 字段 |
| FIX-36 | P0 | 已修复 | Vue composer 增加 @ 候选弹层；Web/Tauri/shared workspace 从会话参与人、成员预览、`users:` channel 派生候选 |

### 16.2 新增验证命令

| 模块 | 命令 | 结果 |
| --- | --- | --- |
| Core SDK batch inbound | `rtk cargo test --manifest-path flare-im-core-sdk/Cargo.toml --features lifecycle-sqlite finish_batch_publishes_batch_without_single_message_replay` | 通过 |
| Core SDK mentions | `rtk cargo test --manifest-path flare-im-core-sdk/Cargo.toml --features lifecycle-sqlite build_text_materializes_structured_user_mentions` | 通过 |
| Load example | `rtk cargo check --manifest-path flare-im-core-sdk/Cargo.toml --example group_latency_throughput --features lifecycle-sqlite` | 通过 |
| TS SDK wire codec | `rtk yarn --cwd flare-im-core-client-sdk/packages/flare-core-typescript-sdk vitest run test/wire_codec_contract.test.ts` | 通过：22 个测试 |
| Vue IM UI | `rtk yarn --cwd flare-im-core-client-sdk/packages/flare-core-vue-im-ui typecheck` | 通过 |
| Vue IM UI smoke | `rtk yarn --cwd flare-im-core-client-sdk/packages/flare-core-vue-im-ui vitest run src/app/shared/testing/smoke.test.ts` | 通过：101 个测试 |
| Web 示例 | `rtk yarn --cwd flare-im-core-client-sdk/examples/flare-core-web-app typecheck` | 通过 |
| Tauri 示例 | `rtk yarn --cwd flare-im-core-client-sdk/examples/flare-core-tauri-app typecheck` | 通过 |

### 16.3 剩余闭环项

| 编号 | 优先级 | 状态 |
| --- | --- | --- |
| BUG-09 | P0 | @ 人核心构造与 Web/Tauri 输入已完成；仍需真实运行专项验证、mention 高亮显示与 `@我` 过滤 UX |
| BUG-17 | P0 | Flutter active timeline 真实窗口复测仍需继续 |
| BUG-19 | P1 | Tauri 仍建议 packaged `.app` 做 Computer Use 验收 |
| BUG-20 | P1 | iOS simulator install 卡住仍需单独解阻 |
| LOAD-01 | P0 | 需要基于 batch-canonical 入站重跑 10 人 x 1000 条，重新测 remote delivery、UI 流畅度、内存增长 |
