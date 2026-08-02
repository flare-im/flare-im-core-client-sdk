// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../contract/BridgeContract';
import type { MessageBuilderApi } from '../api/modules/message_builder';
import { ListMessageBuildCatalogResponse, Message, BuildAnnouncementMessageRequest, BuildAudioMessageRequest, BuildCardMessageRequest, BuildCustomMessageRequest, BuildEmojiMessageRequest, BuildFileMessageRequest, BuildForwardMessageRequest, BuildImageGroupMessageRequest, BuildImageMessageRequest, BuildLinkCardMessageRequest, BuildLocationMessageRequest, BuildMiniProgramMessageRequest, BuildNotificationMessageRequest, BuildPlaceholderMessageRequest, BuildQuoteMessageRequest, BuildRichDocMessageRequest, BuildScheduleMessageRequest, BuildStickerMessageRequest, BuildSystemMessageRequest, BuildTaskMessageRequest, BuildTextMessageRequest, BuildThreadReplyMessageRequest, BuildTypedMessageRequest, BuildVideoMessageRequest, BuildVoteMessageRequest, BuildWithContentMessageRequest, NormalizeRichDocFromDocJsonRequest, NormalizeRichDocFromHtmlRequest, NormalizeRichDocFromMarkdownRequest, RichDocV2Normalized } from '../model';
import { MESSAGE_BUILD_CATALOG } from './MessageBuildCatalog';
import { invokeMap, invokeMessage } from './NativeInvoke';
import { buildAnnouncementMessageRequestToMap, buildAudioMessageRequestToMap, buildCardMessageRequestToMap, buildCustomMessageRequestToMap, buildEmojiMessageRequestToMap, buildFileMessageRequestToMap, buildForwardMessageRequestToMap, buildImageGroupMessageRequestToMap, buildImageMessageRequestToMap, buildLinkCardMessageRequestToMap, buildLocationMessageRequestToMap, buildMiniProgramMessageRequestToMap, buildNotificationMessageRequestToMap, buildPlaceholderMessageRequestToMap, buildQuoteMessageRequestToMap, buildRichDocMessageRequestToMap, buildScheduleMessageRequestToMap, buildStickerMessageRequestToMap, buildSystemMessageRequestToMap, buildTaskMessageRequestToMap, buildTextMessageRequestToMap, buildThreadReplyMessageRequestToMap, buildTypedMessageRequestToMap, buildVideoMessageRequestToMap, buildVoteMessageRequestToMap, buildWithContentMessageRequestToMap, normalizeRichDocFromDocJsonRequestToMap, normalizeRichDocFromHtmlRequestToMap, normalizeRichDocFromMarkdownRequestToMap, richDocV2NormalizedFromJson } from './WireCodec';

export class DefaultMessageBuilderApi implements MessageBuilderApi {
  constructor(private readonly bridge: NativeBridge) {}

  private async dispatchBuildMap(request: Record<string, Object>): Promise<Message> {
    return await invokeMessage(this.bridge, NativeCallMap.messageBuilderDispatch, request);
  }

  async listSupportedBuildOperations(): Promise<ListMessageBuildCatalogResponse> {
    return { entries: MESSAGE_BUILD_CATALOG };
  }

  async normalizeRichDocFromMarkdown(request: NormalizeRichDocFromMarkdownRequest): Promise<RichDocV2Normalized> {
    const raw = await invokeMap(this.bridge, NativeCallMap.richDocV2NormalizeFromMarkdown, normalizeRichDocFromMarkdownRequestToMap(request));
    return richDocV2NormalizedFromJson(raw);
  }

  async normalizeRichDocFromHtml(request: NormalizeRichDocFromHtmlRequest): Promise<RichDocV2Normalized> {
    const raw = await invokeMap(this.bridge, NativeCallMap.richDocV2NormalizeFromHtml, normalizeRichDocFromHtmlRequestToMap(request));
    return richDocV2NormalizedFromJson(raw);
  }

  async normalizeRichDocFromDocJson(request: NormalizeRichDocFromDocJsonRequest): Promise<RichDocV2Normalized> {
    const raw = await invokeMap(this.bridge, NativeCallMap.richDocV2NormalizeFromDocJson, normalizeRichDocFromDocJsonRequestToMap(request));
    return richDocV2NormalizedFromJson(raw);
  }

  async buildAnnouncement(request: BuildAnnouncementMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_announcement", ...buildAnnouncementMessageRequestToMap(request) });
  }

  async buildAudio(request: BuildAudioMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_audio", ...buildAudioMessageRequestToMap(request) });
  }

  async buildCard(request: BuildCardMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_card", ...buildCardMessageRequestToMap(request) });
  }

  async buildCustom(request: BuildCustomMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_custom", ...buildCustomMessageRequestToMap(request) });
  }

  async buildEmoji(request: BuildEmojiMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_emoji", ...buildEmojiMessageRequestToMap(request) });
  }

  async buildFile(request: BuildFileMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_file", ...buildFileMessageRequestToMap(request) });
  }

  async buildForward(request: BuildForwardMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_forward", ...buildForwardMessageRequestToMap(request) });
  }

  async buildImage(request: BuildImageMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_image", ...buildImageMessageRequestToMap(request) });
  }

  async buildImageGroup(request: BuildImageGroupMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_image_group", ...buildImageGroupMessageRequestToMap(request) });
  }

  async buildLinkCard(request: BuildLinkCardMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_link_card", ...buildLinkCardMessageRequestToMap(request) });
  }

  async buildLocation(request: BuildLocationMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_location", ...buildLocationMessageRequestToMap(request) });
  }

  async buildMiniProgram(request: BuildMiniProgramMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_mini_program", ...buildMiniProgramMessageRequestToMap(request) });
  }

  async buildNotification(request: BuildNotificationMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_notification", ...buildNotificationMessageRequestToMap(request) });
  }

  async buildPlaceholder(request: BuildPlaceholderMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_placeholder", ...buildPlaceholderMessageRequestToMap(request) });
  }

  async buildQuote(request: BuildQuoteMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_quote", ...buildQuoteMessageRequestToMap(request) });
  }

  async buildRichDoc(request: BuildRichDocMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_rich_doc", ...buildRichDocMessageRequestToMap(request) });
  }

  async buildSchedule(request: BuildScheduleMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_schedule", ...buildScheduleMessageRequestToMap(request) });
  }

  async buildSticker(request: BuildStickerMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_sticker", ...buildStickerMessageRequestToMap(request) });
  }

  async buildSystem(request: BuildSystemMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_system", ...buildSystemMessageRequestToMap(request) });
  }

  async buildTask(request: BuildTaskMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_task", ...buildTaskMessageRequestToMap(request) });
  }

  async buildText(request: BuildTextMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_text", ...buildTextMessageRequestToMap(request) });
  }

  async buildThreadReply(request: BuildThreadReplyMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_thread_reply", ...buildThreadReplyMessageRequestToMap(request) });
  }

  async buildVideo(request: BuildVideoMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_video", ...buildVideoMessageRequestToMap(request) });
  }

  async buildVote(request: BuildVoteMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_vote", ...buildVoteMessageRequestToMap(request) });
  }

  async buildWithContent(request: BuildWithContentMessageRequest): Promise<Message> {
    return this.dispatchBuildMap({ op: "create_with_content", ...buildWithContentMessageRequestToMap(request) });
  }
}
