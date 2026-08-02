// GENERATED. Do not edit by hand.

/// Build a notification message.
final class BuildNotificationMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `title`. Notification title.
  final String title;
  /// wire: `body`. Notification body.
  final String body;

  const BuildNotificationMessageRequest({
    this.conversationId = '',
    this.title = '',
    this.body = '',
  });
}
