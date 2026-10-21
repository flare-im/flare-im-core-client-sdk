// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/BridgeContract';
import type { MessageBuilderApi } from '../../api/modules/message_builder';
import { MESSAGE_BUILD_CATALOG } from '../catalog/MessageBuildCatalog';
import type { BuildAnnouncementMessageRequest, BuildAudioMessageRequest, BuildCardMessageRequest, BuildCustomMessageRequest, BuildEmojiMessageRequest, BuildFileMessageRequest, BuildForwardMessageRequest, BuildImageGroupMessageRequest, BuildImageMessageRequest, BuildLinkCardMessageRequest, BuildLocationMessageRequest, BuildMiniProgramMessageRequest, BuildNotificationMessageRequest, BuildPlaceholderMessageRequest, BuildPluginMessageRequest, BuildQuoteMessageRequest, BuildRichDocMessageRequest, BuildScheduleMessageRequest, BuildStickerMessageRequest, BuildSystemMessageRequest, BuildTaskMessageRequest, BuildTextMessageRequest, BuildThreadReplyMessageRequest, BuildVideoMessageRequest, BuildVoteMessageRequest, BuildWithContentMessageRequest, ListMessageBuildCatalogResponse, Message, NormalizeRichDocFromDocJsonRequest, NormalizeRichDocFromHtmlRequest, NormalizeRichDocFromMarkdownRequest, RichDocV2Normalized } from '../../model';
import { invokeMap } from '../codec/NativeInvoke';
import { buildAnnouncementMessageRequestToMap, buildAudioMessageRequestToMap, buildCardMessageRequestToMap, buildCustomMessageRequestToMap, buildEmojiMessageRequestToMap, buildFileMessageRequestToMap, buildForwardMessageRequestToMap, buildImageGroupMessageRequestToMap, buildImageMessageRequestToMap, buildLinkCardMessageRequestToMap, buildLocationMessageRequestToMap, buildMiniProgramMessageRequestToMap, buildNotificationMessageRequestToMap, buildPlaceholderMessageRequestToMap, buildPluginMessageRequestToMap, buildQuoteMessageRequestToMap, buildRichDocMessageRequestToMap, buildScheduleMessageRequestToMap, buildStickerMessageRequestToMap, buildSystemMessageRequestToMap, buildTaskMessageRequestToMap, buildTextMessageRequestToMap, buildThreadReplyMessageRequestToMap, buildVideoMessageRequestToMap, buildVoteMessageRequestToMap, buildWithContentMessageRequestToMap, messageFromJson, normalizeRichDocFromDocJsonRequestToMap, normalizeRichDocFromHtmlRequestToMap, normalizeRichDocFromMarkdownRequestToMap, richDocV2NormalizedFromJson } from '../codec/WireCodec';

export class DefaultMessageBuilderApi implements MessageBuilderApi {
  constructor(private readonly bridge: NativeBridge) {}

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
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateAnnouncement, buildAnnouncementMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildAudio(request: BuildAudioMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateAudio, buildAudioMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildCard(request: BuildCardMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateCard, buildCardMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildCustom(request: BuildCustomMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateCustom, buildCustomMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildEmoji(request: BuildEmojiMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateEmoji, buildEmojiMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildFile(request: BuildFileMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateFile, buildFileMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildForward(request: BuildForwardMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateForward, buildForwardMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildImage(request: BuildImageMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateImage, buildImageMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildImageGroup(request: BuildImageGroupMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateImageGroup, buildImageGroupMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildLinkCard(request: BuildLinkCardMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateLinkCard, buildLinkCardMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildLocation(request: BuildLocationMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateLocation, buildLocationMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildMiniProgram(request: BuildMiniProgramMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateMiniProgram, buildMiniProgramMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildNotification(request: BuildNotificationMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateNotification, buildNotificationMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildPlaceholder(request: BuildPlaceholderMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreatePlaceholder, buildPlaceholderMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildPluginMessage(request: BuildPluginMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreatePluginMessage, buildPluginMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildQuote(request: BuildQuoteMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateQuote, buildQuoteMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildRichDoc(request: BuildRichDocMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateRichDoc, buildRichDocMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildSchedule(request: BuildScheduleMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateSchedule, buildScheduleMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildSticker(request: BuildStickerMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateSticker, buildStickerMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildSystem(request: BuildSystemMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateSystem, buildSystemMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildTask(request: BuildTaskMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateTask, buildTaskMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildText(request: BuildTextMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateText, buildTextMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildThreadReply(request: BuildThreadReplyMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateThreadReply, buildThreadReplyMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildVideo(request: BuildVideoMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateVideo, buildVideoMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildVote(request: BuildVoteMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateVote, buildVoteMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }

  async buildWithContent(request: BuildWithContentMessageRequest): Promise<Message> {
    const raw = await invokeMap(this.bridge, NativeCallMap.messageBuilderCreateWithContent, buildWithContentMessageRequestToMap(request));
    return messageFromJson(raw['message'] ?? raw);
  }
}
