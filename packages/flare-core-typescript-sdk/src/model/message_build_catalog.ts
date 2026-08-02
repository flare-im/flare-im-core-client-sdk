/** GENERATED. Do not edit by hand. Built from sdk-spec/shared/message_build_catalog.json */
import type { MessageBuildCatalogEntry } from './message_build_catalog_entry';
import { MessageBuildOp } from './message_build_op';
import { MessageContentType } from './message_content_type';

/** All supported quick-build operations for MessageBuilderApi. */
export const MESSAGE_BUILD_CATALOG: readonly MessageBuildCatalogEntry[] = [
  { op: MessageBuildOp.CreateAnnouncement, method: "buildAnnouncement", requestType: "BuildAnnouncementMessageRequest", contentType: MessageContentType.Announcement, messageType: 83, summary: "Build announcement message", stability: "stable" },
  { op: MessageBuildOp.CreateAudio, method: "buildAudio", requestType: "BuildAudioMessageRequest", contentType: MessageContentType.Audio, messageType: 4, summary: "Build audio message", stability: "stable" },
  { op: MessageBuildOp.CreateCard, method: "buildCard", requestType: "BuildCardMessageRequest", contentType: MessageContentType.Card, messageType: 7, summary: "Build card message", stability: "stable" },
  { op: MessageBuildOp.CreateCustom, method: "buildCustom", requestType: "BuildCustomMessageRequest", contentType: MessageContentType.Custom, messageType: 100, summary: "Build custom message", stability: "stable" },
  { op: MessageBuildOp.CreateEmoji, method: "buildEmoji", requestType: "BuildEmojiMessageRequest", contentType: MessageContentType.Emoji, messageType: 9, summary: "Build emoji message", stability: "stable" },
  { op: MessageBuildOp.CreateFile, method: "buildFile", requestType: "BuildFileMessageRequest", contentType: MessageContentType.File, messageType: 5, summary: "Build file message", stability: "stable" },
  { op: MessageBuildOp.CreateForward, method: "buildForward", requestType: "BuildForwardMessageRequest", contentType: MessageContentType.Forward, messageType: 12, summary: "Build forward message", stability: "stable" },
  { op: MessageBuildOp.CreateImage, method: "buildImage", requestType: "BuildImageMessageRequest", contentType: MessageContentType.Image, messageType: 2, summary: "Build image message", stability: "stable" },
  { op: MessageBuildOp.CreateImageGroup, method: "buildImageGroup", requestType: "BuildImageGroupMessageRequest", contentType: MessageContentType.ImageGroup, messageType: 32, summary: "Multi-image group", stability: "beta" },
  { op: MessageBuildOp.CreateLinkCard, method: "buildLinkCard", requestType: "BuildLinkCardMessageRequest", contentType: MessageContentType.LinkCard, messageType: 11, summary: "Build link card message", stability: "stable" },
  { op: MessageBuildOp.CreateLocation, method: "buildLocation", requestType: "BuildLocationMessageRequest", contentType: MessageContentType.Location, messageType: 6, summary: "Build location message", stability: "stable" },
  { op: MessageBuildOp.CreateMiniProgram, method: "buildMiniProgram", requestType: "BuildMiniProgramMessageRequest", contentType: MessageContentType.MiniProgram, messageType: 13, summary: "Build mini program message", stability: "stable" },
  { op: MessageBuildOp.CreateNotification, method: "buildNotification", requestType: "BuildNotificationMessageRequest", contentType: MessageContentType.Notification, messageType: 61, summary: "Build notification message", stability: "stable" },
  { op: MessageBuildOp.CreatePlaceholder, method: "buildPlaceholder", requestType: "BuildPlaceholderMessageRequest", contentType: MessageContentType.Placeholder, messageType: 111, summary: "Build placeholder message", stability: "stable" },
  { op: MessageBuildOp.CreateQuote, method: "buildQuote", requestType: "BuildQuoteMessageRequest", contentType: MessageContentType.Quote, messageType: 15, summary: "Build quote message", stability: "stable" },
  { op: MessageBuildOp.CreateRichDoc, method: "buildRichDoc", requestType: "BuildRichDocMessageRequest", contentType: MessageContentType.RichText, messageType: 30, summary: "Build rich doc message", stability: "stable" },
  { op: MessageBuildOp.CreateSchedule, method: "buildSchedule", requestType: "BuildScheduleMessageRequest", contentType: MessageContentType.Schedule, messageType: 82, summary: "Build schedule message", stability: "stable" },
  { op: MessageBuildOp.CreateSticker, method: "buildSticker", requestType: "BuildStickerMessageRequest", contentType: MessageContentType.Sticker, messageType: 8, summary: "Build sticker message", stability: "stable" },
  { op: MessageBuildOp.CreateSystem, method: "buildSystem", requestType: "BuildSystemMessageRequest", contentType: MessageContentType.System, messageType: 60, summary: "Build system message", stability: "stable" },
  { op: MessageBuildOp.CreateTask, method: "buildTask", requestType: "BuildTaskMessageRequest", contentType: MessageContentType.Task, messageType: 81, summary: "Build task message", stability: "stable" },
  { op: MessageBuildOp.CreateText, method: "buildText", requestType: "BuildTextMessageRequest", contentType: MessageContentType.Text, messageType: 1, summary: "Build text message", stability: "stable" },
  { op: MessageBuildOp.CreateThreadReply, method: "buildThreadReply", requestType: "BuildThreadReplyMessageRequest", contentType: MessageContentType.Text, messageType: 1, summary: "Build thread reply message", stability: "stable" },
  { op: MessageBuildOp.CreateVideo, method: "buildVideo", requestType: "BuildVideoMessageRequest", contentType: MessageContentType.Video, messageType: 3, summary: "Build video message", stability: "stable" },
  { op: MessageBuildOp.CreateVote, method: "buildVote", requestType: "BuildVoteMessageRequest", contentType: MessageContentType.Vote, messageType: 80, summary: "Build vote message", stability: "stable" },
  { op: MessageBuildOp.CreateWithContent, method: "buildWithContent", requestType: "BuildWithContentMessageRequest", contentType: MessageContentType.Custom, messageType: 100, summary: "Build with content message", stability: "stable" },
] as const;

/** Lookup catalog entry by dispatch op, e.g. `create_text`. */
export function messageBuildCatalogForOp(op: string): MessageBuildCatalogEntry | undefined {
  return MESSAGE_BUILD_CATALOG.find((item) => item.op === op);
}
