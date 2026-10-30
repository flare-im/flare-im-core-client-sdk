/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `message_builder` — Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters.
 */
import type { BuildAnnouncementMessageRequest, BuildAudioMessageRequest, BuildCardMessageRequest, BuildCustomMessageRequest, BuildEmojiMessageRequest, BuildFileMessageRequest, BuildForwardMessageRequest, BuildImageGroupMessageRequest, BuildImageMessageRequest, BuildLinkCardMessageRequest, BuildLocationMessageRequest, BuildMiniProgramMessageRequest, BuildNotificationMessageRequest, BuildPlaceholderMessageRequest, BuildQuoteMessageRequest, BuildRichDocMessageRequest, BuildScheduleMessageRequest, BuildStickerMessageRequest, BuildSystemMessageRequest, BuildTaskMessageRequest, BuildTextMessageRequest, BuildThreadReplyMessageRequest, BuildVideoMessageRequest, BuildVoteMessageRequest, BuildWithContentMessageRequest, ListMessageBuildCatalogResponse, Message, NormalizeRichDocFromDocJsonRequest, NormalizeRichDocFromHtmlRequest, NormalizeRichDocFromMarkdownRequest, RichDocV2Normalized } from '../../model';

/** Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters. */
export interface MessageBuilderApi {
  /** listSupportedBuildOperations maps to `flare_message_build_json` via `catalog-static`. Operation: `message_builder.list_catalog`. */
  listSupportedBuildOperations(): Promise<ListMessageBuildCatalogResponse>;
  /** normalizeRichDocFromMarkdown maps to `flare_sdk_invoke_json`. Operation: `rich_doc_v2.normalize_from_markdown`. */
  normalizeRichDocFromMarkdown(request: NormalizeRichDocFromMarkdownRequest): Promise<RichDocV2Normalized>;
  /** normalizeRichDocFromHtml maps to `flare_sdk_invoke_json`. Operation: `rich_doc_v2.normalize_from_html`. */
  normalizeRichDocFromHtml(request: NormalizeRichDocFromHtmlRequest): Promise<RichDocV2Normalized>;
  /** normalizeRichDocFromDocJson maps to `flare_sdk_invoke_json`. Operation: `rich_doc_v2.normalize_from_doc_json`. */
  normalizeRichDocFromDocJson(request: NormalizeRichDocFromDocJsonRequest): Promise<RichDocV2Normalized>;
  /** buildAnnouncement maps to `flare_message_build_json`, dispatch op `create_announcement`. Operation: `message_builder.create_announcement`. */
  buildAnnouncement(request: BuildAnnouncementMessageRequest): Promise<Message>;
  /** buildAudio maps to `flare_message_build_json`, dispatch op `create_audio`. Operation: `message_builder.create_audio`. */
  buildAudio(request: BuildAudioMessageRequest): Promise<Message>;
  /** buildCard maps to `flare_message_build_json`, dispatch op `create_card`. Operation: `message_builder.create_card`. */
  buildCard(request: BuildCardMessageRequest): Promise<Message>;
  /** buildCustom maps to `flare_message_build_json`, dispatch op `create_custom`. Operation: `message_builder.create_custom`. */
  buildCustom(request: BuildCustomMessageRequest): Promise<Message>;
  /** buildEmoji maps to `flare_message_build_json`, dispatch op `create_emoji`. Operation: `message_builder.create_emoji`. */
  buildEmoji(request: BuildEmojiMessageRequest): Promise<Message>;
  /** buildFile maps to `flare_message_build_json`, dispatch op `create_file`. Operation: `message_builder.create_file`. */
  buildFile(request: BuildFileMessageRequest): Promise<Message>;
  /** buildForward maps to `flare_message_build_json`, dispatch op `create_forward`. Operation: `message_builder.create_forward`. */
  buildForward(request: BuildForwardMessageRequest): Promise<Message>;
  /** buildImage maps to `flare_message_build_json`, dispatch op `create_image`. Operation: `message_builder.create_image`. */
  buildImage(request: BuildImageMessageRequest): Promise<Message>;
  /** buildImageGroup maps to `flare_message_build_json`, dispatch op `create_image_group`. Operation: `message_builder.create_image_group`. */
  buildImageGroup(request: BuildImageGroupMessageRequest): Promise<Message>;
  /** buildLinkCard maps to `flare_message_build_json`, dispatch op `create_link_card`. Operation: `message_builder.create_link_card`. */
  buildLinkCard(request: BuildLinkCardMessageRequest): Promise<Message>;
  /** buildLocation maps to `flare_message_build_json`, dispatch op `create_location`. Operation: `message_builder.create_location`. */
  buildLocation(request: BuildLocationMessageRequest): Promise<Message>;
  /** buildMiniProgram maps to `flare_message_build_json`, dispatch op `create_mini_program`. Operation: `message_builder.create_mini_program`. */
  buildMiniProgram(request: BuildMiniProgramMessageRequest): Promise<Message>;
  /** buildNotification maps to `flare_message_build_json`, dispatch op `create_notification`. Operation: `message_builder.create_notification`. */
  buildNotification(request: BuildNotificationMessageRequest): Promise<Message>;
  /** buildPlaceholder maps to `flare_message_build_json`, dispatch op `create_placeholder`. Operation: `message_builder.create_placeholder`. */
  buildPlaceholder(request: BuildPlaceholderMessageRequest): Promise<Message>;
  /** buildQuote maps to `flare_message_build_json`, dispatch op `create_quote`. Operation: `message_builder.create_quote`. */
  buildQuote(request: BuildQuoteMessageRequest): Promise<Message>;
  /** buildRichDoc maps to `flare_message_build_json`, dispatch op `create_rich_doc`. Operation: `message_builder.create_rich_doc`. */
  buildRichDoc(request: BuildRichDocMessageRequest): Promise<Message>;
  /** buildSchedule maps to `flare_message_build_json`, dispatch op `create_schedule`. Operation: `message_builder.create_schedule`. */
  buildSchedule(request: BuildScheduleMessageRequest): Promise<Message>;
  /** buildSticker maps to `flare_message_build_json`, dispatch op `create_sticker`. Operation: `message_builder.create_sticker`. */
  buildSticker(request: BuildStickerMessageRequest): Promise<Message>;
  /** buildSystem maps to `flare_message_build_json`, dispatch op `create_system`. Operation: `message_builder.create_system`. */
  buildSystem(request: BuildSystemMessageRequest): Promise<Message>;
  /** buildTask maps to `flare_message_build_json`, dispatch op `create_task`. Operation: `message_builder.create_task`. */
  buildTask(request: BuildTaskMessageRequest): Promise<Message>;
  /** buildText maps to `flare_message_build_json`, dispatch op `create_text`. Operation: `message_builder.create_text`. */
  buildText(request: BuildTextMessageRequest): Promise<Message>;
  /** buildThreadReply maps to `flare_message_build_json`, dispatch op `create_thread_reply`. Operation: `message_builder.create_thread_reply`. */
  buildThreadReply(request: BuildThreadReplyMessageRequest): Promise<Message>;
  /** buildVideo maps to `flare_message_build_json`, dispatch op `create_video`. Operation: `message_builder.create_video`. */
  buildVideo(request: BuildVideoMessageRequest): Promise<Message>;
  /** buildVote maps to `flare_message_build_json`, dispatch op `create_vote`. Operation: `message_builder.create_vote`. */
  buildVote(request: BuildVoteMessageRequest): Promise<Message>;
  /** buildWithContent maps to `flare_message_build_json`, dispatch op `create_with_content`. Operation: `message_builder.create_with_content`. */
  buildWithContent(request: BuildWithContentMessageRequest): Promise<Message>;
}
