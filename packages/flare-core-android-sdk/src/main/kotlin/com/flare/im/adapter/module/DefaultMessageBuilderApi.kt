package com.flare.im.adapter.module

import com.flare.im.adapter.codec.*
import com.flare.im.api.messagebuilder.MessageBuilderApi
import com.flare.im.contract.NativeBridge
import com.flare.im.contract.NativeCallMap
import com.flare.im.model.catalog.*
import com.flare.im.model.command.*
import com.flare.im.model.command.message.*
import com.flare.im.model.command.message.build.*
import com.flare.im.model.common.enums.*
import com.flare.im.model.common.error.*
import com.flare.im.model.content.*
import com.flare.im.model.entity.*
import com.flare.im.model.event.*
import com.flare.im.model.event.capability.*
import com.flare.im.model.event.connection.*
import com.flare.im.model.event.conversation.*
import com.flare.im.model.event.lifecycle.*
import com.flare.im.model.event.message.*
import com.flare.im.model.event.presence.*
import com.flare.im.model.event.progress.*
import com.flare.im.model.event.sync.*
import com.flare.im.model.media.*
import com.flare.im.model.query.*
import com.flare.im.model.response.*

/** GENERATED. Do not edit by hand. */
class DefaultMessageBuilderApi(
    private val bridge: NativeBridge,
) : MessageBuilderApi {

    private suspend fun dispatchBuildMap(request: Map<String, Any?>): Message {
        val raw = bridge.invoke<Map<String, Any?>>(NativeCallMap.MESSAGE_BUILDER_DISPATCH, request)
        return messageFromJson(raw["message"] ?: raw)
    }

    override suspend fun listSupportedBuildOperations(): ListMessageBuildCatalogResponse =
        ListMessageBuildCatalogResponse(entries = MESSAGE_BUILD_CATALOG)

    override suspend fun normalizeRichDocFromMarkdown(request: NormalizeRichDocFromMarkdownRequest): RichDocV2Normalized {
        val raw = invokeMap(bridge, NativeCallMap.RICH_DOC_V2_NORMALIZE_FROM_MARKDOWN, normalizeRichDocFromMarkdownRequestToMap(request))
        return richDocV2NormalizedFromJson(raw)
    }

    override suspend fun normalizeRichDocFromHtml(request: NormalizeRichDocFromHtmlRequest): RichDocV2Normalized {
        val raw = invokeMap(bridge, NativeCallMap.RICH_DOC_V2_NORMALIZE_FROM_HTML, normalizeRichDocFromHtmlRequestToMap(request))
        return richDocV2NormalizedFromJson(raw)
    }

    override suspend fun normalizeRichDocFromDocJson(request: NormalizeRichDocFromDocJsonRequest): RichDocV2Normalized {
        val raw = invokeMap(bridge, NativeCallMap.RICH_DOC_V2_NORMALIZE_FROM_DOC_JSON, normalizeRichDocFromDocJsonRequestToMap(request))
        return richDocV2NormalizedFromJson(raw)
    }

    override suspend fun buildAnnouncement(request: BuildAnnouncementMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_announcement")
                putAll(buildAnnouncementMessageRequestToMap(request))
            },
        )

    override suspend fun buildAudio(request: BuildAudioMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_audio")
                put("conversationId", request.conversationId)
                put("audioId", request.audioId)
                request.payload?.let { put("payload", audioContentPayloadToMap(it)) }
            },
        )

    override suspend fun buildCard(request: BuildCardMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_card")
                put("conversationId", request.conversationId)
                put("id", request.id)
                request.cardType?.let { put("cardType", it) }
                request.title?.let { put("title", it) }
                request.subtitle?.let { put("subtitle", it) }
                request.avatar?.let { put("avatar", it) }
            },
        )

    override suspend fun buildCustom(request: BuildCustomMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_custom")
                putAll(buildCustomMessageRequestToMap(request))
            },
        )

    override suspend fun buildEmoji(request: BuildEmojiMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_emoji")
                put("conversationId", request.conversationId)
                put("emoji", request.emoji)
            },
        )

    override suspend fun buildFile(request: BuildFileMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_file")
                put("conversationId", request.conversationId)
                put("fileId", request.fileId)
                request.payload?.let { put("payload", fileContentPayloadToMap(it)) }
            },
        )

    override suspend fun buildForward(request: BuildForwardMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_forward")
                put("conversationId", request.conversationId)
                put("merge", request.merge)
                put("title", request.title)
                if (request.sourceMessages.isNotEmpty()) {
                    put("sourceMessages", request.sourceMessages.map { forwardSourceMessageToMap(it) })
                }
            },
        )

    override suspend fun buildImage(request: BuildImageMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_image")
                put("conversationId", request.conversationId)
                put("imageId", request.imageId)
                request.payload?.let { put("payload", imageContentPayloadToMap(it)) }
            },
        )

    override suspend fun buildImageGroup(request: BuildImageGroupMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_image_group")
                put("conversationId", request.conversationId)
                put("payload", imageGroupContentPayloadToMap(request.payload))
            },
        )

    override suspend fun buildLinkCard(request: BuildLinkCardMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_link_card")
                put("conversationId", request.conversationId)
                put("url", request.url)
                request.title?.let { put("title", it) }
                request.description?.let { put("description", it) }
            },
        )

    override suspend fun buildLocation(request: BuildLocationMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_location")
                put("conversationId", request.conversationId)
                put("latitude", request.latitude)
                put("longitude", request.longitude)
                request.title?.let { put("title", it) }
                request.address?.let { put("address", it) }
            },
        )

    override suspend fun buildMiniProgram(request: BuildMiniProgramMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_mini_program")
                putAll(buildMiniProgramMessageRequestToMap(request))
            },
        )

    override suspend fun buildNotification(request: BuildNotificationMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_notification")
                putAll(buildNotificationMessageRequestToMap(request))
            },
        )

    override suspend fun buildPlaceholder(request: BuildPlaceholderMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_placeholder")
                putAll(buildPlaceholderMessageRequestToMap(request))
            },
        )

    override suspend fun buildQuote(request: BuildQuoteMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_quote")
                put("conversationId", request.conversationId)
                put("quotedMessageId", request.quotedMessageId)
                put("text", request.text)
                request.quotedSenderId?.let { put("quotedSenderId", it) }
                request.quotedTextPreview?.let { put("quotedTextPreview", it) }
            },
        )

    override suspend fun buildRichDoc(request: BuildRichDocMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_rich_doc")
                putAll(buildRichDocMessageRequestToMap(request))
            },
        )

    override suspend fun buildSchedule(request: BuildScheduleMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_schedule")
                putAll(buildScheduleMessageRequestToMap(request))
            },
        )

    override suspend fun buildSticker(request: BuildStickerMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_sticker")
                put("conversationId", request.conversationId)
                put("stickerId", request.stickerId)
                request.packageId?.let { put("packageId", it) }
                request.payload?.let { put("payload", stickerContentPayloadToMap(it)) }
            },
        )

    override suspend fun buildSystem(request: BuildSystemMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_system")
                putAll(buildSystemMessageRequestToMap(request))
            },
        )

    override suspend fun buildTask(request: BuildTaskMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_task")
                putAll(buildTaskMessageRequestToMap(request))
            },
        )

    override suspend fun buildText(request: BuildTextMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_text")
                put("conversationId", request.conversationId)
                put("text", request.text)
            },
        )

    override suspend fun buildThreadReply(request: BuildThreadReplyMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_thread_reply")
                put("conversationId", request.conversationId)
                put("threadId", request.threadId)
                put("text", request.text)
            },
        )

    override suspend fun buildVideo(request: BuildVideoMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_video")
                put("conversationId", request.conversationId)
                put("videoId", request.videoId)
                request.payload?.let { put("payload", videoContentPayloadToMap(it)) }
            },
        )

    override suspend fun buildVote(request: BuildVoteMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_vote")
                putAll(buildVoteMessageRequestToMap(request))
            },
        )

    override suspend fun buildWithContent(request: BuildWithContentMessageRequest): Message =
        dispatchBuildMap(
            buildMap {
                put("op", "create_with_content")
                put("conversationId", request.conversationId)
                put("content", messageContentToMap(request.content))
            },
        )
}
