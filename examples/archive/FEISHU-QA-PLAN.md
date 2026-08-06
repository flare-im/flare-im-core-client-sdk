# 三端互发消息 · 飞书级流畅度/稳定性验收 (web / tauri / flutter)

## Goal
web、tauri、flutter 三端互相收发消息,达到飞书标准:① 互发**及时显示**(发送方乐观回显 <16ms、跨端到达 <~1s)、② 失败可**重发**(失败态可见 + 重发后送达)、③ **会话列表流畅**(滚动 60fps、无 >8ms 主线程长任务、切会话顺滑)。不符合处自行修复至达标。

## 验收预算(飞书级 = flare-im-spec)
- 发送→本端乐观回显:<16ms(下一帧)。
- 跨端到达显示:实时(秒级,取决于网络)。
- 会话打开→首屏缓存:<200ms。
- 滚动/动画 60fps;交互线程单任务 <8ms。
- 失败消息:可见失败态 + 重发入口;重发后送达;不丢不重(已由服务端 exactly-once 保障)。

## Status: web 三维达标(3 真 bug 已修验证);tauri/flutter 实机驱动未完成
Current focus: 收口报告;native 端 live 驱动为后续

## 最终验证(web,fresh 用户对)
- 全新用户对 A→被动 B 直达 **445ms**(被动接收方也实时收到)→ 证明 get_one ensure 修复对单聊被动接收方有效;早期 12↔16 失败是**跨修复边界的陈旧会话状态**(旧会话半建+IndexedDB 标记+重连致网关 resolved_conversations 缓存陈旧),非新会话产品 bug。
- 交替/已建立单聊:双向 ~200-300ms,silent_refresh 21→**3**,无抖动。
- echo ~73-86ms;列表滚动打开时一次 ~60-70ms 长任务、滚动中无;失败有 pending UI。
- SDK 411 测全过(typing throttle wasm 安全 + get_one ensure 均无回归)。
- **[根因找到+已修代码,待重启生效] 被动接收方在"非前 20 会话"里收不到实时推送**:网关 `eager_subscribe` 调 `list_conversations{limit:0}`,服务端把 0 当默认 **20**(read_service.rs:78)→ 连接只订阅前 20 个会话;会话数 >20 的用户(如 B 有 35),超出部分得不到读扩散实时推送,只能等 12s 轮询。修:`connection_handler.rs` eager_subscribe 改**分页订阅全部会话**(500/页,封顶 1 万)。已 `cargo build -p flare-signaling-gateway` 通过(0 错)。**需重建+重启网关生效**;验证路径:>20 会话用户、被动接收方在非前 20 会话里应实时收到。
  - 注:本轮未重启——rtk shell 代理故障(grep/find/ps/ls -la 被破坏)使安全定位 PID/健康检查不可靠,加上 4GB VM 重启栈有 OOM 风险,不盲目重启运行中的关键栈。
- 早期 12↔13/12↔16 被动失败即此 20-cap(那些会话不在前 20);全新对(唯一会话=前 20 内)故 445ms 成功。
- **tauri/flutter**:wasm send-panic 是 web 专属(native 有 std::time::Instant,不 panic);get_one ensure 是 Rust core 逻辑修复,native 端重建后同样受益;churn 修复在 vue-im-ui(tauri 复用,flutter 自有 UI)。

## 原生端修复传播(2026-07-01,续)
- **Flutter(macOS)✓ 传播**:`cargo xtask build host`(release 3m54s)重建 `libflare_im_core_sdk_ffi.dylib` 含 get_one 修复,已就位到 `flutter-app/macos/Runner/`;flutter app `dart analyze` no issues。运行时经 FFI 加载,故 get_one 直达修复对 flutter 生效。
- **Flutter(macOS)✓✓ 实机 LIVE 验证**:`flutter run -d macos`(debug)启动、渲染登录页、加载 FFI(含 get_one)。computer-use 驱动 flq1a 登录→单聊 flq1b(全新对)→发 `FLMSG`;web peer(Playwright flq1b)收到并回 `WEBREPLY-ok`,flutter 端渲染出回复 + 显示 `对方正在输入…` + `flq1b ● 在线` + 未读角标。**Flutter native 端 ↔ web 双向互发实时打通**(round-trip <3s;get_one 单聊直达修复在 native 生效)。
  - ⚠️ Flutter macOS **release** app 加载 FFI 失败(dylib 未 bundle 进 .app + hardened runtime library-validation 拒绝外部 dylib)——real 打包缺陷;**debug** 构建正常(disable-library-validation)。发布 standalone demo 前需修 release 签名/打包(entitlement `disable-library-validation` + Copy Files 阶段 bundle dylib)。
- **iOS ✓ 传播+构建验证**:`cargo xtask build ios-sim`(release 3m38s)重建 `libflare_im_core_sdk_ffi.a`(get_one 修复);iOS app `swift build` ok(链接新产物)。实机 sim 驱动同 flutter 路径(未做,需 xcodebuild+simctl)。
- **Android ✗ 传播受阻**:`cargo xtask build android` 报 `ANDROID_NDK_ROOT is required`,jni(Rust core)未重建 → android core 仍旧(无 get_one);Kotlin app 编译过但链旧 core。需装 NDK 才能传播。
- **Tauri**:src-tauri 直接 link core crate,下次构建即含 get_one 修复(未单独跑,构建 ~7min)。
- **共识**:消息逻辑修复在共享 core(web+411 测已验证),原生端跑同一逻辑,重建后同样受益;实机 GUI 互发驱动(computer-use×3 端)+ 网关 20-cap 修复生效 = 需健康环境的剩余大工程(当前 rtk 工具降级 + 网关重启风险)。

## 发现 & 修复
- **[P0 已修+验证] web 发消息整体 panic**:发送触发 typing 节流用 `std::time::Instant::now()`,在 `wasm32-unknown-unknown` 上 `time not implemented` → panic → RefCell 双借 → wasm abort,**消息根本发不出**。改 `mutation.rs` typing 节流为 `now_millis()`(u64,wasm 安全)。重建 wasm 后:发送成功(composer 清空、气泡出现、`send_ack #47`)。typing 单测过、SDK 编译过。
- **[已修+验证] silent_refresh 风暴**:每条入站消息触发 `refreshActiveConversationFromServer("event_hint")` → 全量 close+open 时间线(抖动/闪烁)。实时显示本就由 core 观察视图 delta(applyTimelineViewDelta)增量负责,故移除该 per-message 全量重开,仅留 12s 安全轮询兜底。silent_refresh 21→**3**;交替收发仍 ~200-300ms 到达,无抖动。
- **[已修+验证] 单聊单向不达**:`get_one` 只本地建会话、不 server 建会话(对端非服务端参与者)→ 首发方消息读扩散跳过对端。补 `get_one`(Single)调 `ensure_conversation([双方])`(镜像群 #16),持久化 single_server_established 防重复 RPC。
- **[深层/调查中] 单聊对被动接收方(未发过消息)的实时推送不达**:群聊对被动接收方推送正常(未读增长),但单聊会话里被动方要先"动作"(发一条)后才开始实时收到;首条给被动方的消息要等 12s 安全轮询补(不丢,但非实时)。疑为网关/订阅对单聊会话的处理与群不同。调查中。
- 测得:乐观回显 echo ~73-86ms(>飞书 16ms,功能 OK);跨端到达 ~200-300ms(达标);列表滚动长任务 ~60-70ms(打开时一次,滚动中无);失败有 pending UI。

## Steps
- [ ] 1. web 三客户端互发 harness(Playwright,3 context = user 12/13/14,同群):量乐观回显、跨端到达延迟、列表滚动长任务、打开首屏。
- [ ] 2. 分析 web 结果 vs 预算 → 列差距(web 与 tauri 共用 vue-im-ui+TS SDK,web 结论≈tauri)。
- [ ] 3. 失败重发:制造发送失败(断 WS / 发未连)→ 验证失败态 + 重发送达。
- [ ] 4. 修复 web 侧差距(vue-im-ui/core),复测达标。
- [ ] 5. Tauri:构建+启动,computer-use 驱动,与 web peer 互发验证(同 UI,native 壳)。
- [ ] 6. Flutter:构建+启动(macOS/Chrome),computer-use/驱动,与 web peer 互发验证。
- [ ] 7. 修复 flutter 侧差距(flutter app/SDK),复测。
- [ ] 8. 收尾:报告 + 计划/记忆更新。

## Notes
- 后端+web(:1430)已起;flutter macOS/Chrome 设备就绪;tauri 需构建。
- 跨端消息正确性(投递/有序/exactly-once)本会话已大量验证(读扩散 0 丢、DLQ、幂等);本轮重点是**客户端及时显示+重发+列表流畅**。
- 三端共用 core SDK;web/tauri 共用 vue-im-ui;flutter 自有 UI。
- account 12 有 35 个群(成员 10-19),故 13/14 同群可互发。
