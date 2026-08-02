// GENERATED. Do not edit by hand.

/// Build an announcement message.
final class BuildAnnouncementMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `title`. Announcement title.
  final String title;
  /// wire: `body`. Announcement body.
  final String body;

  const BuildAnnouncementMessageRequest({
    this.conversationId = '',
    this.title = '',
    this.body = '',
  });
}
