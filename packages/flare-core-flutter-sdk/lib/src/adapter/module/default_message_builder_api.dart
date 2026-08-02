// GENERATED. Do not edit by hand.
import '../../api/api.dart';
import '../../contract/bridge_contract.dart';
import '../../model/model.dart';
import '../codec/wire_codec.dart';

final class DefaultMessageBuilderApi implements MessageBuilderApi {
  DefaultMessageBuilderApi(this._bridge);

  final NativeBridge _bridge;

  Future<Message> _dispatchBuildMap(Map<String, Object?> request) async {
    final raw = await _bridge.invoke<Map<String, Object?>>(NativeCallMap.messageBuilderDispatch, request);
    return messageFromJson(raw['message'] ?? raw);
  }

  @override
  Future<ListMessageBuildCatalogResponse> listSupportedBuildOperations() async {
    return const ListMessageBuildCatalogResponse(entries: messageBuildCatalog);
  }

  @override
  Future<RichDocV2Normalized> normalizeRichDocFromMarkdown(NormalizeRichDocFromMarkdownRequest request) async {
    final requestMap = <String, Object?>{
      'markdown': request.markdown,
    };
    final raw = await _bridge.invoke<Map<String, Object?>>(NativeCallMap.richDocV2NormalizeFromMarkdown, requestMap);
    return richDocV2NormalizedFromJson(raw);
  }

  @override
  Future<RichDocV2Normalized> normalizeRichDocFromHtml(NormalizeRichDocFromHtmlRequest request) async {
    final requestMap = <String, Object?>{
      'html': request.html,
    };
    final raw = await _bridge.invoke<Map<String, Object?>>(NativeCallMap.richDocV2NormalizeFromHtml, requestMap);
    return richDocV2NormalizedFromJson(raw);
  }

  @override
  Future<RichDocV2Normalized> normalizeRichDocFromDocJson(NormalizeRichDocFromDocJsonRequest request) async {
    final requestMap = <String, Object?>{
      'docJson': request.docJson,
    };
    final raw = await _bridge.invoke<Map<String, Object?>>(NativeCallMap.richDocV2NormalizeFromDocJson, requestMap);
    return richDocV2NormalizedFromJson(raw);
  }

  @override
  Future<Message> buildAnnouncement(BuildAnnouncementMessageRequest request) => _dispatchBuildMap({
      'op': "create_announcement",
      'conversationId': request.conversationId,
      'title': request.title,
      'body': request.body,
    });

  @override
  Future<Message> buildAudio(BuildAudioMessageRequest request) => _dispatchBuildMap({
      'op': "create_audio",
      'conversationId': request.conversationId,
      'audioId': request.audioId,
    });

  @override
  Future<Message> buildCard(BuildCardMessageRequest request) => _dispatchBuildMap({
      'op': "create_card",
      'conversationId': request.conversationId,
      'id': request.id,
      if (request.cardType != null) 'cardType': request.cardType!,
      if (request.title != null) 'title': request.title!,
      if (request.subtitle != null) 'subtitle': request.subtitle!,
      if (request.avatar != null) 'avatar': request.avatar!
    });

  @override
  Future<Message> buildCustom(BuildCustomMessageRequest request) => _dispatchBuildMap({
      'op': "create_custom",
      'conversationId': request.conversationId,
      'type': request.type,
    });

  @override
  Future<Message> buildEmoji(BuildEmojiMessageRequest request) => _dispatchBuildMap({
      'op': "create_emoji",
      'conversationId': request.conversationId,
      'emoji': request.emoji,
    });

  @override
  Future<Message> buildFile(BuildFileMessageRequest request) => _dispatchBuildMap({
      'op': "create_file",
      'conversationId': request.conversationId,
      'fileId': request.fileId,
    });

  @override
  Future<Message> buildForward(BuildForwardMessageRequest request) => _dispatchBuildMap({
      'op': "create_forward",
      'conversationId': request.conversationId,
      'merge': request.merge ?? false,
      'title': request.title,
      'sourceMessages': request.sourceMessages
          .map((item) => {
        'sourceMessageId': item.sourceMessageId,
        if (item.sourceConversationId != null)
          'sourceConversationId': item.sourceConversationId!,
        if (item.sourceSenderId != null)
          'sourceSenderId': item.sourceSenderId!,
        if (item.plainText != null) 'plainText': item.plainText!,
      }).toList(growable: false),
    });

  @override
  Future<Message> buildImage(BuildImageMessageRequest request) => _dispatchBuildMap({
      'op': "create_image",
      'conversationId': request.conversationId,
      'imageId': request.imageId,
    });

  @override
  Future<Message> buildImageGroup(BuildImageGroupMessageRequest request) => _dispatchBuildMap({
      'op': "create_image_group",
      'conversationId': request.conversationId,
      'images': request.payload.images
          .map((item) => {
        'imageId': item.imageId,
        if (item.url != null) 'url': item.url!,
        if (item.title != null) 'title': item.title!,
        if (item.width != null) 'width': item.width!,
        if (item.height != null) 'height': item.height!,
      }).toList(growable: false),
      if (request.payload.title != null) 'title': request.payload.title!,
    });

  @override
  Future<Message> buildLinkCard(BuildLinkCardMessageRequest request) => _dispatchBuildMap({
      'op': "create_link_card",
      'conversationId': request.conversationId,
      'url': request.url,
      if (request.title != null) 'title': request.title!,
      if (request.description != null) 'description': request.description!,
      if (request.thumbnailUrl != null) 'thumbnailUrl': request.thumbnailUrl!,
      if (request.siteName != null) 'siteName': request.siteName!
    });

  @override
  Future<Message> buildLocation(BuildLocationMessageRequest request) => _dispatchBuildMap({
      'op': "create_location",
      'conversationId': request.conversationId,
      'latitude': request.latitude,
      'longitude': request.longitude,
      if (request.title != null) 'title': request.title!,
      if (request.address != null) 'address': request.address!
    });

  @override
  Future<Message> buildMiniProgram(BuildMiniProgramMessageRequest request) => _dispatchBuildMap({
      'op': "create_mini_program",
      'conversationId': request.conversationId,
      'appId': request.appId,
      if (request.pagePath != null) 'pagePath': request.pagePath!,
      if (request.title != null) 'title': request.title!,
      if (request.thumbnailUrl != null) 'thumbnailUrl': request.thumbnailUrl!
    });

  @override
  Future<Message> buildNotification(BuildNotificationMessageRequest request) => _dispatchBuildMap({
      'op': "create_notification",
      'conversationId': request.conversationId,
      'title': request.title,
      'body': request.body,
    });

  @override
  Future<Message> buildPlaceholder(BuildPlaceholderMessageRequest request) => _dispatchBuildMap({
      'op': "create_placeholder",
      'conversationId': request.conversationId,
      'reason': request.reason,
    });

  @override
  Future<Message> buildQuote(BuildQuoteMessageRequest request) => _dispatchBuildMap({
      'op': "create_quote",
      'conversationId': request.conversationId,
      'quotedMessageId': request.quotedMessageId,
      'text': request.text,
      if (request.quotedSenderId != null) 'quotedSenderId': request.quotedSenderId!,
      if (request.quotedTextPreview != null) 'quotedTextPreview': request.quotedTextPreview!,
      'quotedContent': messageContentToWireMap(request.quotedContent),
    });

  @override
  Future<Message> buildRichDoc(BuildRichDocMessageRequest request) => _dispatchBuildMap({
      'op': "create_rich_doc",
      'conversationId': request.conversationId,
      'docJson': request.docJson,
      'contentSchema': request.contentSchema,
      'plainText': request.plainText,
      if (request.inputFormat != null) 'inputFormat': request.inputFormat!,
      if (request.inputFormatVersion != null) 'inputFormatVersion': request.inputFormatVersion!,
      if (request.title != null) 'title': request.title!,
      if (request.searchText != null) 'searchText': request.searchText!,
      if (request.renderHintsJson != null) 'renderHintsJson': request.renderHintsJson!
    });

  @override
  Future<Message> buildSchedule(BuildScheduleMessageRequest request) => _dispatchBuildMap({
      'op': "create_schedule",
      'conversationId': request.conversationId,
      'scheduleId': request.scheduleId,
      'title': request.title,
      'startTimeMs': request.startTimeMs,
      'endTimeMs': request.endTimeMs,
      'participantUserIds': request.participantUserIds,
    });

  @override
  Future<Message> buildSticker(BuildStickerMessageRequest request) => _dispatchBuildMap({
      'op': "create_sticker",
      'conversationId': request.conversationId,
      'stickerId': request.stickerId,
      if (request.packageId != null) 'packageId': request.packageId!
    });

  @override
  Future<Message> buildSystem(BuildSystemMessageRequest request) => _dispatchBuildMap({
      'op': "create_system",
      'conversationId': request.conversationId,
      'eventKind': request.eventKind,
      'body': request.body,
    });

  @override
  Future<Message> buildTask(BuildTaskMessageRequest request) => _dispatchBuildMap({
      'op': "create_task",
      'conversationId': request.conversationId,
      'taskId': request.taskId,
      'title': request.title,
      if (request.status != null) 'status': request.status!,
      'participantUserIds': request.participantUserIds,
    });

  @override
  Future<Message> buildText(BuildTextMessageRequest request) => _dispatchBuildMap({
      'op': "create_text",
      'conversationId': request.conversationId,
      'text': request.text,
      'mentionUsers': request.mentionUsers ?? const <String>[],
      'mentionAll': request.mentionAll ?? false,
    });

  @override
  Future<Message> buildThreadReply(BuildThreadReplyMessageRequest request) => _dispatchBuildMap({
      'op': "create_thread_reply",
      'conversationId': request.conversationId,
      'threadId': request.threadId,
      'text': request.text,
    });

  @override
  Future<Message> buildVideo(BuildVideoMessageRequest request) => _dispatchBuildMap({
      'op': "create_video",
      'conversationId': request.conversationId,
      'videoId': request.videoId,
    });

  @override
  Future<Message> buildVote(BuildVoteMessageRequest request) => _dispatchBuildMap({
      'op': "create_vote",
      'conversationId': request.conversationId,
      'voteId': request.voteId,
      'title': request.title,
      'options': request.options,
      'participantUserIds': request.participantUserIds,
    });

  @override
  Future<Message> buildWithContent(BuildWithContentMessageRequest request) => _dispatchBuildMap({
      'op': "create_with_content",
      'conversationId': request.conversationId,
      'content': messageContentToWireMap(request.content),
    });
}
