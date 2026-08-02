// GENERATED. Do not edit by hand.
import 'message_build_catalog_entry.dart';
import 'message_build_op.dart';
import '../common/enums/message_content_type.dart';

/// All supported quick-build operations for MessageBuilderApi.
const List<MessageBuildCatalogEntry> messageBuildCatalog = [
  MessageBuildCatalogEntry(op: MessageBuildOp.createAnnouncement, method: "buildAnnouncement", requestType: "BuildAnnouncementMessageRequest", contentType: MessageContentType.announcement, messageType: 83, summary: "Build announcement message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createAudio, method: "buildAudio", requestType: "BuildAudioMessageRequest", contentType: MessageContentType.audio, messageType: 4, summary: "Build audio message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createCard, method: "buildCard", requestType: "BuildCardMessageRequest", contentType: MessageContentType.card, messageType: 7, summary: "Build card message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createCustom, method: "buildCustom", requestType: "BuildCustomMessageRequest", contentType: MessageContentType.custom, messageType: 100, summary: "Build custom message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createEmoji, method: "buildEmoji", requestType: "BuildEmojiMessageRequest", contentType: MessageContentType.emoji, messageType: 9, summary: "Build emoji message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createFile, method: "buildFile", requestType: "BuildFileMessageRequest", contentType: MessageContentType.file, messageType: 5, summary: "Build file message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createForward, method: "buildForward", requestType: "BuildForwardMessageRequest", contentType: MessageContentType.forward, messageType: 12, summary: "Build forward message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createImage, method: "buildImage", requestType: "BuildImageMessageRequest", contentType: MessageContentType.image, messageType: 2, summary: "Build image message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createImageGroup, method: "buildImageGroup", requestType: "BuildImageGroupMessageRequest", contentType: MessageContentType.imageGroup, messageType: 32, summary: "Multi-image group", stability: "beta"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createLinkCard, method: "buildLinkCard", requestType: "BuildLinkCardMessageRequest", contentType: MessageContentType.linkCard, messageType: 11, summary: "Build link card message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createLocation, method: "buildLocation", requestType: "BuildLocationMessageRequest", contentType: MessageContentType.location, messageType: 6, summary: "Build location message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createMiniProgram, method: "buildMiniProgram", requestType: "BuildMiniProgramMessageRequest", contentType: MessageContentType.miniProgram, messageType: 13, summary: "Build mini program message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createNotification, method: "buildNotification", requestType: "BuildNotificationMessageRequest", contentType: MessageContentType.notification, messageType: 61, summary: "Build notification message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createPlaceholder, method: "buildPlaceholder", requestType: "BuildPlaceholderMessageRequest", contentType: MessageContentType.placeholder, messageType: 111, summary: "Build placeholder message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createQuote, method: "buildQuote", requestType: "BuildQuoteMessageRequest", contentType: MessageContentType.quote, messageType: 15, summary: "Build quote message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createRichDoc, method: "buildRichDoc", requestType: "BuildRichDocMessageRequest", contentType: MessageContentType.richText, messageType: 30, summary: "Build rich doc message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createSchedule, method: "buildSchedule", requestType: "BuildScheduleMessageRequest", contentType: MessageContentType.schedule, messageType: 82, summary: "Build schedule message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createSticker, method: "buildSticker", requestType: "BuildStickerMessageRequest", contentType: MessageContentType.sticker, messageType: 8, summary: "Build sticker message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createSystem, method: "buildSystem", requestType: "BuildSystemMessageRequest", contentType: MessageContentType.system, messageType: 60, summary: "Build system message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createTask, method: "buildTask", requestType: "BuildTaskMessageRequest", contentType: MessageContentType.task, messageType: 81, summary: "Build task message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createText, method: "buildText", requestType: "BuildTextMessageRequest", contentType: MessageContentType.text, messageType: 1, summary: "Build text message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createThreadReply, method: "buildThreadReply", requestType: "BuildThreadReplyMessageRequest", contentType: MessageContentType.text, messageType: 1, summary: "Build thread reply message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createVideo, method: "buildVideo", requestType: "BuildVideoMessageRequest", contentType: MessageContentType.video, messageType: 3, summary: "Build video message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createVote, method: "buildVote", requestType: "BuildVoteMessageRequest", contentType: MessageContentType.vote, messageType: 80, summary: "Build vote message", stability: "stable"),
  MessageBuildCatalogEntry(op: MessageBuildOp.createWithContent, method: "buildWithContent", requestType: "BuildWithContentMessageRequest", contentType: MessageContentType.custom, messageType: 100, summary: "Build with content message", stability: "stable"),
];
