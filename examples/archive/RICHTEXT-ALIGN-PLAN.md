# 一期富文本能力对齐（设计→执行）

## Goal
五端（flutter 基准 / iOS / Android / web / tauri）富文本在四维全对齐：编辑(格式工具条→Markdown 标记) / 发送(create_rich_doc) / 消息展示(doc_json) / 会话展示(plain_text)，含编辑已发(editRichDocByMessageId)。每端改完编译验证。

## 设计（已定）
- **内容模型在 core**（权威，已存在）：RICH_TEXT(15)，doc_json(RichDoc v2)+plain_text；core `rich_doc_v2` 归一化 Markdown/HTML→doc_json。各端编辑器产出 Markdown，core 归一化，**编辑模型不下沉**。
- 节点：paragraph/heading/quote/code_block/bullet_list/ordered_list/list_item/divider；inline text/link；marks bold/italic/underline/strike/spoiler。
- Markdown 标记约定（与 Flutter formatter 一致）：bold `**` / italic `*` / strike `~~` / inlineCode `` ` `` / link `[](url)`；block heading `#` / quote `> ` / bullet `- ` / ordered `1. ` / codeBlock ```` ``` ````。

## 现状矩阵（编辑 / 发送 / 展示 / 预览 / 编辑已发）
- Flutter 基准：✓✓✓✓✓
- iOS：✓✓✓✓✓
- Vue(web/tauri)：✓✓✓✓✓
- **Android：✗(仅 Markdown 表单)✓✓✓ ?** ← 唯一真实大缺口=内联编辑

## Status: 核心对齐完成（五端五维打通）
Current focus: 可选——editRich 的消息菜单入口（当前 op 已可达，菜单按钮为可用性增强）

## Steps
- [x] **Android 编辑**：composer String→TextFieldValue；富文本图标 toggle `richMode`（选中高亮 brand）；richMode 显示格式工具条（粗/斜/删/码/标题/引用/无序/有序）→ 选区感知插入 Markdown；发送 richMode→`buildAndSend(CreateRichDoc,{markdown})`→core 归一化。`:app:compileDebugKotlin` BUILD SUCCESSFUL（修 Article/FormatListBulleted→AutoMirrored 警告）。
- [x] Android 编辑已发：补 `messageAction("editRich")`→`editRichDocByMessageId(req+markdown)`。编译通过。
- [x] iOS 编辑已发：补 `case "editRich"`→`editRichDocByMessageId`（apple SDK 有此方法）。`swift build` Build complete。
- [x] iOS/Vue/Flutter 四维核实：iOS createRichDoc 发送+RichComposerEditor 编辑+MessageRichViews 展示齐全；Vue ComposerRichMarkdownInput+RichTextView+dispatch 编辑齐全；Flutter 基准。无回归。
- [x] editRich 消息长按菜单入口：Android `MessageRowView` 列表加 "Edit rich"→messageAction("editRich")；iOS `MessageMenuModel` 加 `case editRich`（标题"编辑富文本"、符号 doc.richtext，仅 richText 消息显示）+ `MessageRowViews` 分发。两端编译通过（swift build / compileDebugKotlin）。

## 完成：富文本五端五维（编辑/发送/展示/预览/编辑已发）全对齐 + editRich 菜单入口，内容模型统一在 core RichDoc v2。

## Notes
- Android 发送侧已就绪：`MessageBuilder.CreateRichDoc`(74-89) 已 `normalizeRichDocFromMarkdown`→docJson+plainText。
- Android 展示已就绪：`RichDocRenderer.RichDocText` 渲染 heading/list/quote/code + bold/italic/underline/strike/code。
- 复用既有 toolbar 图标（之前对齐时加的"富文档"槽，本次改为 toggle richMode）。
