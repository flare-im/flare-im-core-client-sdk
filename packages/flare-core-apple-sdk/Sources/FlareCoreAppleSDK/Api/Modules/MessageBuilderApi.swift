import Foundation

/// GENERATED. Do not edit by hand.
/// Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters.
public protocol MessageBuilderApiProtocol: AnyObject {
    func listSupportedBuildOperations() async throws -> ListMessageBuildCatalogResponse
    func normalizeRichDocFromMarkdown(_ request: NormalizeRichDocFromMarkdownRequest) async throws -> RichDocV2Normalized
    func normalizeRichDocFromHtml(_ request: NormalizeRichDocFromHtmlRequest) async throws -> RichDocV2Normalized
    func normalizeRichDocFromDocJson(_ request: NormalizeRichDocFromDocJsonRequest) async throws -> RichDocV2Normalized
    func buildAnnouncement(_ request: BuildAnnouncementMessageRequest) async throws -> Message
    func buildAudio(_ request: BuildAudioMessageRequest) async throws -> Message
    func buildCard(_ request: BuildCardMessageRequest) async throws -> Message
    func buildCustom(_ request: BuildCustomMessageRequest) async throws -> Message
    func buildEmoji(_ request: BuildEmojiMessageRequest) async throws -> Message
    func buildFile(_ request: BuildFileMessageRequest) async throws -> Message
    func buildForward(_ request: BuildForwardMessageRequest) async throws -> Message
    func buildImage(_ request: BuildImageMessageRequest) async throws -> Message
    func buildImageGroup(_ request: BuildImageGroupMessageRequest) async throws -> Message
    func buildLinkCard(_ request: BuildLinkCardMessageRequest) async throws -> Message
    func buildLocation(_ request: BuildLocationMessageRequest) async throws -> Message
    func buildMiniProgram(_ request: BuildMiniProgramMessageRequest) async throws -> Message
    func buildNotification(_ request: BuildNotificationMessageRequest) async throws -> Message
    func buildPlaceholder(_ request: BuildPlaceholderMessageRequest) async throws -> Message
    func buildQuote(_ request: BuildQuoteMessageRequest) async throws -> Message
    func buildRichDoc(_ request: BuildRichDocMessageRequest) async throws -> Message
    func buildSchedule(_ request: BuildScheduleMessageRequest) async throws -> Message
    func buildSticker(_ request: BuildStickerMessageRequest) async throws -> Message
    func buildSystem(_ request: BuildSystemMessageRequest) async throws -> Message
    func buildTask(_ request: BuildTaskMessageRequest) async throws -> Message
    func buildText(_ request: BuildTextMessageRequest) async throws -> Message
    func buildThreadReply(_ request: BuildThreadReplyMessageRequest) async throws -> Message
    func buildVideo(_ request: BuildVideoMessageRequest) async throws -> Message
    func buildVote(_ request: BuildVoteMessageRequest) async throws -> Message
    func buildWithContent(_ request: BuildWithContentMessageRequest) async throws -> Message
}
