// GENERATED. Do not edit by hand.

/// Build a link card message.
final class BuildLinkCardMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `url`. Link URL.
  final String url;
  /// wire: `title`. Card title.
  final String? title;
  /// wire: `description`. Card description.
  final String? description;
  /// wire: `thumbnailUrl`. Thumbnail URL.
  final String? thumbnailUrl;
  /// wire: `siteName`. Site name.
  final String? siteName;

  const BuildLinkCardMessageRequest({
    this.conversationId = '',
    this.url = '',
    this.title,
    this.description,
    this.thumbnailUrl,
    this.siteName,
  });
}
