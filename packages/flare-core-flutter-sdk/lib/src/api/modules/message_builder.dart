// GENERATED. Do not edit by hand.
// Module API: `message_builder` — Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters.
import '../../model/model.dart';

/// Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters.
abstract interface class MessageBuilderApi {
  /// listSupportedBuildOperations maps to `flare_message_build_json` via `catalog-static`. Operation: `message_builder.list_catalog`.
  Future<ListMessageBuildCatalogResponse> listSupportedBuildOperations();
  /// normalizeRichDocFromMarkdown maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `rich_doc_v2.normalize_from_markdown`.
  Future<RichDocV2Normalized> normalizeRichDocFromMarkdown(NormalizeRichDocFromMarkdownRequest request);
  /// normalizeRichDocFromHtml maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `rich_doc_v2.normalize_from_html`.
  Future<RichDocV2Normalized> normalizeRichDocFromHtml(NormalizeRichDocFromHtmlRequest request);
  /// normalizeRichDocFromDocJson maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `rich_doc_v2.normalize_from_doc_json`.
  Future<RichDocV2Normalized> normalizeRichDocFromDocJson(NormalizeRichDocFromDocJsonRequest request);
  /// buildAnnouncement maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_announcement`. Operation: `message_builder.create_announcement`.
  Future<Message> buildAnnouncement(BuildAnnouncementMessageRequest request);
  /// buildAudio maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_audio`. Operation: `message_builder.create_audio`.
  Future<Message> buildAudio(BuildAudioMessageRequest request);
  /// buildCard maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_card`. Operation: `message_builder.create_card`.
  Future<Message> buildCard(BuildCardMessageRequest request);
  /// buildCustom maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_custom`. Operation: `message_builder.create_custom`.
  Future<Message> buildCustom(BuildCustomMessageRequest request);
  /// buildEmoji maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_emoji`. Operation: `message_builder.create_emoji`.
  Future<Message> buildEmoji(BuildEmojiMessageRequest request);
  /// buildFile maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_file`. Operation: `message_builder.create_file`.
  Future<Message> buildFile(BuildFileMessageRequest request);
  /// buildForward maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_forward`. Operation: `message_builder.create_forward`.
  Future<Message> buildForward(BuildForwardMessageRequest request);
  /// buildImage maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_image`. Operation: `message_builder.create_image`.
  Future<Message> buildImage(BuildImageMessageRequest request);
  /// buildImageGroup maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_image_group`. Operation: `message_builder.create_image_group`.
  Future<Message> buildImageGroup(BuildImageGroupMessageRequest request);
  /// buildLinkCard maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_link_card`. Operation: `message_builder.create_link_card`.
  Future<Message> buildLinkCard(BuildLinkCardMessageRequest request);
  /// buildLocation maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_location`. Operation: `message_builder.create_location`.
  Future<Message> buildLocation(BuildLocationMessageRequest request);
  /// buildMiniProgram maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_mini_program`. Operation: `message_builder.create_mini_program`.
  Future<Message> buildMiniProgram(BuildMiniProgramMessageRequest request);
  /// buildNotification maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_notification`. Operation: `message_builder.create_notification`.
  Future<Message> buildNotification(BuildNotificationMessageRequest request);
  /// buildPlaceholder maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_placeholder`. Operation: `message_builder.create_placeholder`.
  Future<Message> buildPlaceholder(BuildPlaceholderMessageRequest request);
  /// buildQuote maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_quote`. Operation: `message_builder.create_quote`.
  Future<Message> buildQuote(BuildQuoteMessageRequest request);
  /// buildRichDoc maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_rich_doc`. Operation: `message_builder.create_rich_doc`.
  Future<Message> buildRichDoc(BuildRichDocMessageRequest request);
  /// buildSchedule maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_schedule`. Operation: `message_builder.create_schedule`.
  Future<Message> buildSchedule(BuildScheduleMessageRequest request);
  /// buildSticker maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_sticker`. Operation: `message_builder.create_sticker`.
  Future<Message> buildSticker(BuildStickerMessageRequest request);
  /// buildSystem maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_system`. Operation: `message_builder.create_system`.
  Future<Message> buildSystem(BuildSystemMessageRequest request);
  /// buildTask maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_task`. Operation: `message_builder.create_task`.
  Future<Message> buildTask(BuildTaskMessageRequest request);
  /// buildText maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_text`. Operation: `message_builder.create_text`.
  Future<Message> buildText(BuildTextMessageRequest request);
  /// buildThreadReply maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_thread_reply`. Operation: `message_builder.create_thread_reply`.
  Future<Message> buildThreadReply(BuildThreadReplyMessageRequest request);
  /// buildVideo maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_video`. Operation: `message_builder.create_video`.
  Future<Message> buildVideo(BuildVideoMessageRequest request);
  /// buildVote maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_vote`. Operation: `message_builder.create_vote`.
  Future<Message> buildVote(BuildVoteMessageRequest request);
  /// buildWithContent maps to `flare_message_build_json` via `dispatch-json`, dispatch op `create_with_content`. Operation: `message_builder.create_with_content`.
  Future<Message> buildWithContent(BuildWithContentMessageRequest request);
}
