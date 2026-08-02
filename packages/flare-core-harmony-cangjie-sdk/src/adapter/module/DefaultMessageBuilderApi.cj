package flare_core_harmony_cangjie_sdk.adapter

import encoding.json.JsonObject as CjJsonObject
import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.MessageBuilderApi
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.

public class DefaultMessageBuilderApi <: MessageBuilderApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    private func dispatchBuildJson(requestJson: String): Message {
        let raw = bridge.invoke(descriptor: NativeCallMap.messageBuilderDispatch, requestJson: requestJson)
        return messageFromEnvelopeJson(raw)
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
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_announcement")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "text", request.text)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildAudio(request: BuildAudioMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_audio")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "audioId", request.audioId)
        match (request.payload) {
            case Some(value) => jsonPutRaw(json, "payload", audioContentPayloadToJson(value))
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildCard(request: BuildCardMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_card")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "id", request.id)
        match (request.cardType) {
            case Some(value) => jsonPutString(json, "cardType", value)
            case None => ()
        }
        match (request.title) {
            case Some(value) => jsonPutString(json, "title", value)
            case None => ()
        }
        match (request.subtitle) {
            case Some(value) => jsonPutString(json, "subtitle", value)
            case None => ()
        }
        match (request.avatar) {
            case Some(value) => jsonPutString(json, "avatar", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildCustom(request: BuildCustomMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_custom")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "typeKey", request.typeKey)
        jsonPutRaw(json, "data", request.data)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildEmoji(request: BuildEmojiMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_emoji")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "emoji", request.emoji)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildFile(request: BuildFileMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_file")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "fileId", request.fileId)
        match (request.payload) {
            case Some(value) => jsonPutRaw(json, "payload", fileContentPayloadToJson(value))
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildForward(request: BuildForwardMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_forward")
        jsonPutString(json, "conversationId", request.conversationId)
        match (request.merge) {
            case Some(value) => jsonPutBool(json, "merge", value)
            case None => ()
        }
        jsonPutString(json, "title", request.title)
        jsonPutRaw(json, "sourceMessages", request.sourceMessages)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildImage(request: BuildImageMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_image")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "imageId", request.imageId)
        match (request.payload) {
            case Some(value) => jsonPutRaw(json, "payload", imageContentPayloadToJson(value))
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildImageGroup(request: BuildImageGroupMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_image_group")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutRaw(json, "payload", imageGroupContentPayloadToJson(request.payload))
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildLinkCard(request: BuildLinkCardMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_link_card")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "url", request.url)
        match (request.title) {
            case Some(value) => jsonPutString(json, "title", value)
            case None => ()
        }
        match (request.description) {
            case Some(value) => jsonPutString(json, "description", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildLocation(request: BuildLocationMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_location")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "latitude", request.latitude)
        jsonPutString(json, "longitude", request.longitude)
        match (request.title) {
            case Some(value) => jsonPutString(json, "title", value)
            case None => ()
        }
        match (request.address) {
            case Some(value) => jsonPutString(json, "address", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildMiniProgram(request: BuildMiniProgramMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_mini_program")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "appId", request.appId)
        match (request.path) {
            case Some(value) => jsonPutString(json, "path", value)
            case None => ()
        }
        match (request.title) {
            case Some(value) => jsonPutString(json, "title", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildNotification(request: BuildNotificationMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_notification")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "text", request.text)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildPlaceholder(request: BuildPlaceholderMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_placeholder")
        jsonPutString(json, "conversationId", request.conversationId)
        match (request.hint) {
            case Some(value) => jsonPutString(json, "hint", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildQuote(request: BuildQuoteMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_quote")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "quotedMessageId", request.quotedMessageId)
        jsonPutString(json, "text", request.text)
        match (request.quotedSenderId) {
            case Some(value) => jsonPutString(json, "quotedSenderId", value)
            case None => ()
        }
        match (request.quotedTextPreview) {
            case Some(value) => jsonPutString(json, "quotedTextPreview", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildRichDoc(request: BuildRichDocMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_rich_doc")
        jsonPutString(json, "conversationId", request.conversationId)
        match (request.docJson) {
            case Some(value) => jsonPutString(json, "docJson", value)
            case None => ()
        }
        match (request.markdown) {
            case Some(value) => jsonPutString(json, "markdown", value)
            case None => ()
        }
        match (request.html) {
            case Some(value) => jsonPutString(json, "html", value)
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildSchedule(request: BuildScheduleMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_schedule")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutRaw(json, "data", request.data)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildSticker(request: BuildStickerMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_sticker")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "stickerId", request.stickerId)
        match (request.packageId) {
            case Some(value) => jsonPutString(json, "packageId", value)
            case None => ()
        }
        match (request.payload) {
            case Some(value) => jsonPutRaw(json, "payload", stickerContentPayloadToJson(value))
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildSystem(request: BuildSystemMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_system")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "text", request.text)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildTask(request: BuildTaskMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_task")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutRaw(json, "data", request.data)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildText(request: BuildTextMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_text")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "text", request.text)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildThreadReply(request: BuildThreadReplyMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_thread_reply")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "threadId", request.threadId)
        jsonPutString(json, "text", request.text)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildVideo(request: BuildVideoMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_video")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutString(json, "videoId", request.videoId)
        match (request.payload) {
            case Some(value) => jsonPutRaw(json, "payload", videoContentPayloadToJson(value))
            case None => ()
        }
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildVote(request: BuildVoteMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_vote")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutRaw(json, "data", request.data)
        return dispatchBuildJson(json.toJsonString())
    }

    public func buildWithContent(request: BuildWithContentMessageRequest): Message {
        let json = CjJsonObject()
        jsonPutString(json, "op", "create_with_content")
        jsonPutString(json, "conversationId", request.conversationId)
        jsonPutRaw(json, "content", messageContentToJson(request.content))
        return dispatchBuildJson(json.toJsonString())
    }

}
