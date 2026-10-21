package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public class DefaultMessageBuilderApi <: MessageBuilderApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func listSupportedBuildOperations(): ListMessageBuildCatalogResponse {
        return ListMessageBuildCatalogResponse(entries: MESSAGE_BUILD_CATALOG_ENTRIES_JSON)
    }

    public func normalizeRichDocFromMarkdown(request: NormalizeRichDocFromMarkdownRequest): RichDocV2Normalized {
        let raw = bridge.invoke(descriptor: NativeCallMap.richDocV2NormalizeFromMarkdown, requestJson: wireEncodeRequest(normalizeRichDocFromMarkdownRequestToJson(request)))
        return richDocV2NormalizedFromJson(raw)
    }

    public func normalizeRichDocFromHtml(request: NormalizeRichDocFromHtmlRequest): RichDocV2Normalized {
        let raw = bridge.invoke(descriptor: NativeCallMap.richDocV2NormalizeFromHtml, requestJson: wireEncodeRequest(normalizeRichDocFromHtmlRequestToJson(request)))
        return richDocV2NormalizedFromJson(raw)
    }

    public func normalizeRichDocFromDocJson(request: NormalizeRichDocFromDocJsonRequest): RichDocV2Normalized {
        let raw = bridge.invoke(descriptor: NativeCallMap.richDocV2NormalizeFromDocJson, requestJson: wireEncodeRequest(normalizeRichDocFromDocJsonRequestToJson(request)))
        return richDocV2NormalizedFromJson(raw)
    }

    public func buildAnnouncement(request: BuildAnnouncementMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateAnnouncement, requestJson: wireEncodeRequest(buildAnnouncementMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildAudio(request: BuildAudioMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateAudio, requestJson: wireEncodeRequest(buildAudioMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildCard(request: BuildCardMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateCard, requestJson: wireEncodeRequest(buildCardMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildCustom(request: BuildCustomMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateCustom, requestJson: wireEncodeRequest(buildCustomMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildEmoji(request: BuildEmojiMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateEmoji, requestJson: wireEncodeRequest(buildEmojiMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildFile(request: BuildFileMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateFile, requestJson: wireEncodeRequest(buildFileMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildForward(request: BuildForwardMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateForward, requestJson: wireEncodeRequest(buildForwardMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildImage(request: BuildImageMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateImage, requestJson: wireEncodeRequest(buildImageMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildImageGroup(request: BuildImageGroupMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateImageGroup, requestJson: wireEncodeRequest(buildImageGroupMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildLinkCard(request: BuildLinkCardMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateLinkCard, requestJson: wireEncodeRequest(buildLinkCardMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildLocation(request: BuildLocationMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateLocation, requestJson: wireEncodeRequest(buildLocationMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildMiniProgram(request: BuildMiniProgramMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateMiniProgram, requestJson: wireEncodeRequest(buildMiniProgramMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildNotification(request: BuildNotificationMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateNotification, requestJson: wireEncodeRequest(buildNotificationMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildPlaceholder(request: BuildPlaceholderMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreatePlaceholder, requestJson: wireEncodeRequest(buildPlaceholderMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildPluginMessage(request: BuildPluginMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreatePluginMessage, requestJson: wireEncodeRequest(buildPluginMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildQuote(request: BuildQuoteMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateQuote, requestJson: wireEncodeRequest(buildQuoteMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildRichDoc(request: BuildRichDocMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateRichDoc, requestJson: wireEncodeRequest(buildRichDocMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildSchedule(request: BuildScheduleMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateSchedule, requestJson: wireEncodeRequest(buildScheduleMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildSticker(request: BuildStickerMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateSticker, requestJson: wireEncodeRequest(buildStickerMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildSystem(request: BuildSystemMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateSystem, requestJson: wireEncodeRequest(buildSystemMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildTask(request: BuildTaskMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateTask, requestJson: wireEncodeRequest(buildTaskMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildText(request: BuildTextMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateText, requestJson: wireEncodeRequest(buildTextMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildThreadReply(request: BuildThreadReplyMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateThreadReply, requestJson: wireEncodeRequest(buildThreadReplyMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildVideo(request: BuildVideoMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateVideo, requestJson: wireEncodeRequest(buildVideoMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildVote(request: BuildVoteMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateVote, requestJson: wireEncodeRequest(buildVoteMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }

    public func buildWithContent(request: BuildWithContentMessageRequest): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderCreateWithContent, requestJson: wireEncodeRequest(buildWithContentMessageRequestToJson(request)))
        return messageFromEnvelopeJson(raw)
    }
}
