# 一期示例 — 消息输入框对齐 Flutter（执行计划）

## Goal
以 Flutter composer 为基准（见 COMPOSER-DESIGN-SPEC.md），将其他一期平台的消息输入框移动端**布局/排版**改造为两行结构（圆角白底输入框 + 6 槽均分图标工具栏），各平台复用自身 token、保留原有行为。每平台改完即编译验证。

## Constraints
- 只改 composer 栏的版式，不改行为/handler。
- 复用各平台既有设计 token，不引魔法值。
- 不加内联圆形发送按钮（移动端走 IME 发送键）。
- Android 用 material-icons-extended 矢量图标替代 emoji 字形。

## Status: Android 完成；iOS 评估为已对齐；Vue/功能对齐待定
Current focus: 等用户定 iOS 深度 / Vue / 功能对齐优先级

## Steps
- [x] 提取 Flutter 基准设计 → COMPOSER-DESIGN-SPEC.md
- [x] **Android**：加 material-icons-extended；ComposerBar 单行→两行（白底圆角输入框 IME 发送 + 6 槽均分图标工具栏 emoji/@/mic/image/富文档/更多；emoji 字形→矢量描边图标）。`:app:compileDebugKotlin` BUILD SUCCESSFUL（已修 Article→AutoMirrored 警告）。
- [x] **iOS**（按用户选择"精确对齐 6 图标"）：工具栏改为 Flutter 6 槽均分（表情/@提及/语音/图片/富文本/更多）；「展开」+「发送」移到输入行尾部（iOS 多行无 IME 发送键，发送须显式按钮，避免回归）；@提及插入"@"。`swift build` Build complete。注：仅编译验证，视觉/运行需模拟器确认。
- [x] Vue（共享 `EnhancedComposer.vue`，web+tauri+uni 受益）：核查发现**本就是两行布局 + 工具栏 grid 均分**（核心移动端版式已满足）。补上 Flutter 缺的 **@提及**图标（AtCircleOutline + i18n composer.mention 已存在 + `insertAtCursor('@')`，grid 7→8）。`vue-tsc` 0 error。
  - 未做（有意保留）：把 send/expand 移出工具栏到输入行（iOS 同款精确处理）。原因：Vue 工具栏 CSS 是 grid + 浮动两套布局模式 + `!important`，桌面优先，**只能 typecheck 无法视觉验证**，对 web/tauri 两个一期 app 回归风险高。待能跑起 app 视觉确认后再做。
- [x] 一期功能基线对齐：核查确认**基线 8 能力五端全覆盖**。共享 Vue 包剩余 12 个 `·` 复核 → 8 个等价覆盖（dispatch/基础变体，不加冗余）、**4 个真缺已补**（session.prepare/uninit/hardReset + messages.sendMessageNoOss，加在 useFlareCoreClient.runSessionOperation + FlareSdkLabPanel.vue 按钮）。`vue-tsc` 0 error。web/uni/tauri 95→99。改一处三端受益。

## Notes
- Android tokens 映射：brand=primary、surface=输入框底、background=栏底、hairline=顶边框、radiusSmall(6)、type.body(15sp)、textSecondary=工具栏图标。
- Android 现状：单行 [☺][🎙][+菜单][OutlinedTextField][→发送]，emoji 字形。
- Android 现有能力：emoji 面板、录音、图片 picker、+构建菜单（image/video/location/file/card/task/vote/schedule/richdoc/linkcard/sticker）。无 @提及/富文本切换 → 6 槽用 emoji/@(插入@)/mic/image/richdoc(或留)/more(+菜单)。
