package com.flare.im.model.catalog

import com.flare.im.model.common.enums.MessageContentType

/** GENERATED. Do not edit by hand. */
/** All supported quick-build operations for MessageBuilderApi. */
val MESSAGE_BUILD_CATALOG: List<MessageBuildCatalogEntry> = listOf(
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_ANNOUNCEMENT, method = "buildAnnouncement", requestType = "BuildAnnouncementMessageRequest", contentType = MessageContentType.ANNOUNCEMENT, messageType = 83, summary = "Build announcement message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_AUDIO, method = "buildAudio", requestType = "BuildAudioMessageRequest", contentType = MessageContentType.AUDIO, messageType = 4, summary = "Build audio message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_CARD, method = "buildCard", requestType = "BuildCardMessageRequest", contentType = MessageContentType.CARD, messageType = 7, summary = "Build card message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_CUSTOM, method = "buildCustom", requestType = "BuildCustomMessageRequest", contentType = MessageContentType.CUSTOM, messageType = 100, summary = "Build custom message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_EMOJI, method = "buildEmoji", requestType = "BuildEmojiMessageRequest", contentType = MessageContentType.EMOJI, messageType = 9, summary = "Build emoji message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_FILE, method = "buildFile", requestType = "BuildFileMessageRequest", contentType = MessageContentType.FILE, messageType = 5, summary = "Build file message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_FORWARD, method = "buildForward", requestType = "BuildForwardMessageRequest", contentType = MessageContentType.FORWARD, messageType = 12, summary = "Build forward message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_IMAGE, method = "buildImage", requestType = "BuildImageMessageRequest", contentType = MessageContentType.IMAGE, messageType = 2, summary = "Build image message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_IMAGE_GROUP, method = "buildImageGroup", requestType = "BuildImageGroupMessageRequest", contentType = MessageContentType.IMAGE_GROUP, messageType = 32, summary = "Multi-image group", stability = "beta"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_LINK_CARD, method = "buildLinkCard", requestType = "BuildLinkCardMessageRequest", contentType = MessageContentType.LINK_CARD, messageType = 11, summary = "Build link card message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_LOCATION, method = "buildLocation", requestType = "BuildLocationMessageRequest", contentType = MessageContentType.LOCATION, messageType = 6, summary = "Build location message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_MINI_PROGRAM, method = "buildMiniProgram", requestType = "BuildMiniProgramMessageRequest", contentType = MessageContentType.MINI_PROGRAM, messageType = 13, summary = "Build mini program message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_NOTIFICATION, method = "buildNotification", requestType = "BuildNotificationMessageRequest", contentType = MessageContentType.NOTIFICATION, messageType = 61, summary = "Build notification message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_PLACEHOLDER, method = "buildPlaceholder", requestType = "BuildPlaceholderMessageRequest", contentType = MessageContentType.PLACEHOLDER, messageType = 111, summary = "Build placeholder message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_QUOTE, method = "buildQuote", requestType = "BuildQuoteMessageRequest", contentType = MessageContentType.QUOTE, messageType = 15, summary = "Build quote message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_RICH_DOC, method = "buildRichDoc", requestType = "BuildRichDocMessageRequest", contentType = MessageContentType.RICH_TEXT, messageType = 30, summary = "Build rich doc message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_SCHEDULE, method = "buildSchedule", requestType = "BuildScheduleMessageRequest", contentType = MessageContentType.SCHEDULE, messageType = 82, summary = "Build schedule message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_STICKER, method = "buildSticker", requestType = "BuildStickerMessageRequest", contentType = MessageContentType.STICKER, messageType = 8, summary = "Build sticker message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_SYSTEM, method = "buildSystem", requestType = "BuildSystemMessageRequest", contentType = MessageContentType.SYSTEM, messageType = 60, summary = "Build system message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_TASK, method = "buildTask", requestType = "BuildTaskMessageRequest", contentType = MessageContentType.TASK, messageType = 81, summary = "Build task message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_TEXT, method = "buildText", requestType = "BuildTextMessageRequest", contentType = MessageContentType.TEXT, messageType = 1, summary = "Build text message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_THREAD_REPLY, method = "buildThreadReply", requestType = "BuildThreadReplyMessageRequest", contentType = MessageContentType.TEXT, messageType = 1, summary = "Build thread reply message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_VIDEO, method = "buildVideo", requestType = "BuildVideoMessageRequest", contentType = MessageContentType.VIDEO, messageType = 3, summary = "Build video message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_VOTE, method = "buildVote", requestType = "BuildVoteMessageRequest", contentType = MessageContentType.VOTE, messageType = 80, summary = "Build vote message", stability = "stable"),
    MessageBuildCatalogEntry(op = MessageBuildOp.CREATE_WITH_CONTENT, method = "buildWithContent", requestType = "BuildWithContentMessageRequest", contentType = MessageContentType.CUSTOM, messageType = 100, summary = "Build with content message", stability = "stable"),
)
