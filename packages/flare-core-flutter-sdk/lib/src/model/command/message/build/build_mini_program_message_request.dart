// GENERATED. Do not edit by hand.

/// Build a mini program message.
final class BuildMiniProgramMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `appId`. Mini program app id.
  final String appId;
  /// wire: `pagePath`. Entry path.
  final String? pagePath;
  /// wire: `title`. Display title.
  final String? title;
  /// wire: `thumbnailUrl`. Thumbnail URL.
  final String? thumbnailUrl;
  /// wire: `extra`. Mini program extension fields.
  final Map<String, String>? extra;

  const BuildMiniProgramMessageRequest({
    this.conversationId = '',
    this.appId = '',
    this.pagePath,
    this.title,
    this.thumbnailUrl,
    this.extra,
  });
}
