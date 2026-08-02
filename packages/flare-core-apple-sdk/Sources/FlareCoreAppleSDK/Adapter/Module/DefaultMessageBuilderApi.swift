import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultMessageBuilderApi: MessageBuilderApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    private func dispatchBuildMap(_ descriptor: NativeCallDescriptor, request: [String: AnySendable]) async throws -> Message {
        let raw = try await invokeMap(bridge, descriptor: descriptor, request: request)
        return try messageFromJson(raw["message"] ?? raw)
    }

    public func listSupportedBuildOperations() async throws -> ListMessageBuildCatalogResponse {
        ListMessageBuildCatalogResponse(entries: messageBuildCatalog)
    }

    public func normalizeRichDocFromMarkdown(_ request: NormalizeRichDocFromMarkdownRequest) async throws -> RichDocV2Normalized {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.richDocV2NormalizeFromMarkdown, request: unwrapRequest(AnySendable(normalizeRichDocFromMarkdownRequestToMap(request))))
        return try richDocV2NormalizedFromJson(raw)
    }

    public func normalizeRichDocFromHtml(_ request: NormalizeRichDocFromHtmlRequest) async throws -> RichDocV2Normalized {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.richDocV2NormalizeFromHtml, request: unwrapRequest(AnySendable(normalizeRichDocFromHtmlRequestToMap(request))))
        return try richDocV2NormalizedFromJson(raw)
    }

    public func normalizeRichDocFromDocJson(_ request: NormalizeRichDocFromDocJsonRequest) async throws -> RichDocV2Normalized {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.richDocV2NormalizeFromDocJson, request: unwrapRequest(AnySendable(normalizeRichDocFromDocJsonRequestToMap(request))))
        return try richDocV2NormalizedFromJson(raw)
    }

    public func buildAnnouncement(_ request: BuildAnnouncementMessageRequest) async throws -> Message {
        var wire = buildAnnouncementMessageRequestToMap(request); wire["op"] = AnySendable("create_announcement"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateAnnouncement, request: wire)
    }

    public func buildAudio(_ request: BuildAudioMessageRequest) async throws -> Message {
        var wire = buildAudioMessageRequestToMap(request); wire["op"] = AnySendable("create_audio"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateAudio, request: wire)
    }

    public func buildCard(_ request: BuildCardMessageRequest) async throws -> Message {
        var wire = buildCardMessageRequestToMap(request); wire["op"] = AnySendable("create_card"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateCard, request: wire)
    }

    public func buildCustom(_ request: BuildCustomMessageRequest) async throws -> Message {
        var wire = buildCustomMessageRequestToMap(request); wire["op"] = AnySendable("create_custom"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateCustom, request: wire)
    }

    public func buildEmoji(_ request: BuildEmojiMessageRequest) async throws -> Message {
        var wire = buildEmojiMessageRequestToMap(request); wire["op"] = AnySendable("create_emoji"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateEmoji, request: wire)
    }

    public func buildFile(_ request: BuildFileMessageRequest) async throws -> Message {
        var wire = buildFileMessageRequestToMap(request); wire["op"] = AnySendable("create_file"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateFile, request: wire)
    }

    public func buildForward(_ request: BuildForwardMessageRequest) async throws -> Message {
        var wire = buildForwardMessageRequestToMap(request); wire["op"] = AnySendable("create_forward"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateForward, request: wire)
    }

    public func buildImage(_ request: BuildImageMessageRequest) async throws -> Message {
        var wire = buildImageMessageRequestToMap(request); wire["op"] = AnySendable("create_image"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateImage, request: wire)
    }

    public func buildImageGroup(_ request: BuildImageGroupMessageRequest) async throws -> Message {
        var wire = buildImageGroupMessageRequestToMap(request); wire["op"] = AnySendable("create_image_group"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateImageGroup, request: wire)
    }

    public func buildLinkCard(_ request: BuildLinkCardMessageRequest) async throws -> Message {
        var wire = buildLinkCardMessageRequestToMap(request); wire["op"] = AnySendable("create_link_card"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateLinkCard, request: wire)
    }

    public func buildLocation(_ request: BuildLocationMessageRequest) async throws -> Message {
        var wire = buildLocationMessageRequestToMap(request); wire["op"] = AnySendable("create_location"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateLocation, request: wire)
    }

    public func buildMiniProgram(_ request: BuildMiniProgramMessageRequest) async throws -> Message {
        var wire = buildMiniProgramMessageRequestToMap(request); wire["op"] = AnySendable("create_mini_program"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateMiniProgram, request: wire)
    }

    public func buildNotification(_ request: BuildNotificationMessageRequest) async throws -> Message {
        var wire = buildNotificationMessageRequestToMap(request); wire["op"] = AnySendable("create_notification"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateNotification, request: wire)
    }

    public func buildPlaceholder(_ request: BuildPlaceholderMessageRequest) async throws -> Message {
        var wire = buildPlaceholderMessageRequestToMap(request); wire["op"] = AnySendable("create_placeholder"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreatePlaceholder, request: wire)
    }

    public func buildQuote(_ request: BuildQuoteMessageRequest) async throws -> Message {
        var wire = buildQuoteMessageRequestToMap(request); wire["op"] = AnySendable("create_quote"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateQuote, request: wire)
    }

    public func buildRichDoc(_ request: BuildRichDocMessageRequest) async throws -> Message {
        var wire = buildRichDocMessageRequestToMap(request); wire["op"] = AnySendable("create_rich_doc"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateRichDoc, request: wire)
    }

    public func buildSchedule(_ request: BuildScheduleMessageRequest) async throws -> Message {
        var wire = buildScheduleMessageRequestToMap(request); wire["op"] = AnySendable("create_schedule"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateSchedule, request: wire)
    }

    public func buildSticker(_ request: BuildStickerMessageRequest) async throws -> Message {
        var wire = buildStickerMessageRequestToMap(request); wire["op"] = AnySendable("create_sticker"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateSticker, request: wire)
    }

    public func buildSystem(_ request: BuildSystemMessageRequest) async throws -> Message {
        var wire = buildSystemMessageRequestToMap(request); wire["op"] = AnySendable("create_system"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateSystem, request: wire)
    }

    public func buildTask(_ request: BuildTaskMessageRequest) async throws -> Message {
        var wire = buildTaskMessageRequestToMap(request); wire["op"] = AnySendable("create_task"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateTask, request: wire)
    }

    public func buildText(_ request: BuildTextMessageRequest) async throws -> Message {
        var wire = buildTextMessageRequestToMap(request); wire["op"] = AnySendable("create_text"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateText, request: wire)
    }

    public func buildThreadReply(_ request: BuildThreadReplyMessageRequest) async throws -> Message {
        var wire = buildThreadReplyMessageRequestToMap(request); wire["op"] = AnySendable("create_thread_reply"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateThreadReply, request: wire)
    }

    public func buildVideo(_ request: BuildVideoMessageRequest) async throws -> Message {
        var wire = buildVideoMessageRequestToMap(request); wire["op"] = AnySendable("create_video"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateVideo, request: wire)
    }

    public func buildVote(_ request: BuildVoteMessageRequest) async throws -> Message {
        var wire = buildVoteMessageRequestToMap(request); wire["op"] = AnySendable("create_vote"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateVote, request: wire)
    }

    public func buildWithContent(_ request: BuildWithContentMessageRequest) async throws -> Message {
        var wire = buildWithContentMessageRequestToMap(request); wire["op"] = AnySendable("create_with_content"); return try await dispatchBuildMap(NativeCallMap.messageBuilderCreateWithContent, request: wire)
    }
}
