import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultMessageBuilderApi: MessageBuilderApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func listSupportedBuildOperations() async throws -> ListMessageBuildCatalogResponse {
        return ListMessageBuildCatalogResponse(entries: messageBuildCatalog)
    }

    public func normalizeRichDocFromMarkdown(_ request: NormalizeRichDocFromMarkdownRequest) async throws -> RichDocV2Normalized {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.richDocV2NormalizeFromMarkdown, request: normalizeRichDocFromMarkdownRequestToMap(request))
        return try richDocV2NormalizedFromJson(raw)
    }

    public func normalizeRichDocFromHtml(_ request: NormalizeRichDocFromHtmlRequest) async throws -> RichDocV2Normalized {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.richDocV2NormalizeFromHtml, request: normalizeRichDocFromHtmlRequestToMap(request))
        return try richDocV2NormalizedFromJson(raw)
    }

    public func normalizeRichDocFromDocJson(_ request: NormalizeRichDocFromDocJsonRequest) async throws -> RichDocV2Normalized {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.richDocV2NormalizeFromDocJson, request: normalizeRichDocFromDocJsonRequestToMap(request))
        return try richDocV2NormalizedFromJson(raw)
    }

    public func buildAnnouncement(_ request: BuildAnnouncementMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateAnnouncement, request: buildAnnouncementMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildAudio(_ request: BuildAudioMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateAudio, request: buildAudioMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildCard(_ request: BuildCardMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateCard, request: buildCardMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildCustom(_ request: BuildCustomMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateCustom, request: buildCustomMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildEmoji(_ request: BuildEmojiMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateEmoji, request: buildEmojiMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildFile(_ request: BuildFileMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateFile, request: buildFileMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildForward(_ request: BuildForwardMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateForward, request: buildForwardMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildImage(_ request: BuildImageMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateImage, request: buildImageMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildImageGroup(_ request: BuildImageGroupMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateImageGroup, request: buildImageGroupMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildLinkCard(_ request: BuildLinkCardMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateLinkCard, request: buildLinkCardMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildLocation(_ request: BuildLocationMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateLocation, request: buildLocationMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildMiniProgram(_ request: BuildMiniProgramMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateMiniProgram, request: buildMiniProgramMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildNotification(_ request: BuildNotificationMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateNotification, request: buildNotificationMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildPlaceholder(_ request: BuildPlaceholderMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreatePlaceholder, request: buildPlaceholderMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildPluginMessage(_ request: BuildPluginMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreatePluginMessage, request: buildPluginMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildQuote(_ request: BuildQuoteMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateQuote, request: buildQuoteMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildRichDoc(_ request: BuildRichDocMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateRichDoc, request: buildRichDocMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildSchedule(_ request: BuildScheduleMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateSchedule, request: buildScheduleMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildSticker(_ request: BuildStickerMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateSticker, request: buildStickerMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildSystem(_ request: BuildSystemMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateSystem, request: buildSystemMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildTask(_ request: BuildTaskMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateTask, request: buildTaskMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildText(_ request: BuildTextMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateText, request: buildTextMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildThreadReply(_ request: BuildThreadReplyMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateThreadReply, request: buildThreadReplyMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildVideo(_ request: BuildVideoMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateVideo, request: buildVideoMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildVote(_ request: BuildVoteMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateVote, request: buildVoteMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func buildWithContent(_ request: BuildWithContentMessageRequest) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.messageBuilderCreateWithContent, request: buildWithContentMessageRequestToMap(request))
        return try messageFromJson(raw["message"] ?? raw)
    }
}
