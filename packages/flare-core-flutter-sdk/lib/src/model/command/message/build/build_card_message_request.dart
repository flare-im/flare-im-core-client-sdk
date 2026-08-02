// GENERATED. Do not edit by hand.

/// Build a structured card message.
final class BuildCardMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `id`. Card target id.
  final String id;
  /// wire: `cardType`. Card type key.
  final String? cardType;
  /// wire: `title`. Display title.
  final String? title;
  /// wire: `subtitle`. Display subtitle.
  final String? subtitle;
  /// wire: `avatar`. Avatar URL or media id.
  final String? avatar;

  const BuildCardMessageRequest({
    this.conversationId = '',
    this.id = '',
    this.cardType,
    this.title,
    this.subtitle,
    this.avatar,
  });
}
