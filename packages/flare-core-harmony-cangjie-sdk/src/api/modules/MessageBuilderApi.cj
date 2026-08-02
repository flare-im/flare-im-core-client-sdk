package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters.
public interface MessageBuilderApi {
    func listSupportedBuildOperations(): ListMessageBuildCatalogResponse
    func normalizeRichDocFromMarkdown(request: NormalizeRichDocFromMarkdownRequest): RichDocV2Normalized
    func normalizeRichDocFromHtml(request: NormalizeRichDocFromHtmlRequest): RichDocV2Normalized
    func normalizeRichDocFromDocJson(request: NormalizeRichDocFromDocJsonRequest): RichDocV2Normalized
    func buildAnnouncement(request: BuildAnnouncementMessageRequest): Message
    func buildAudio(request: BuildAudioMessageRequest): Message
    func buildCard(request: BuildCardMessageRequest): Message
    func buildCustom(request: BuildCustomMessageRequest): Message
    func buildEmoji(request: BuildEmojiMessageRequest): Message
    func buildFile(request: BuildFileMessageRequest): Message
    func buildForward(request: BuildForwardMessageRequest): Message
    func buildImage(request: BuildImageMessageRequest): Message
    func buildImageGroup(request: BuildImageGroupMessageRequest): Message
    func buildLinkCard(request: BuildLinkCardMessageRequest): Message
    func buildLocation(request: BuildLocationMessageRequest): Message
    func buildMiniProgram(request: BuildMiniProgramMessageRequest): Message
    func buildNotification(request: BuildNotificationMessageRequest): Message
    func buildPlaceholder(request: BuildPlaceholderMessageRequest): Message
    func buildQuote(request: BuildQuoteMessageRequest): Message
    func buildRichDoc(request: BuildRichDocMessageRequest): Message
    func buildSchedule(request: BuildScheduleMessageRequest): Message
    func buildSticker(request: BuildStickerMessageRequest): Message
    func buildSystem(request: BuildSystemMessageRequest): Message
    func buildTask(request: BuildTaskMessageRequest): Message
    func buildText(request: BuildTextMessageRequest): Message
    func buildThreadReply(request: BuildThreadReplyMessageRequest): Message
    func buildVideo(request: BuildVideoMessageRequest): Message
    func buildVote(request: BuildVoteMessageRequest): Message
    func buildWithContent(request: BuildWithContentMessageRequest): Message
}
