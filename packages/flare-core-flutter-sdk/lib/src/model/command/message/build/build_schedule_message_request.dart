// GENERATED. Do not edit by hand.

/// Build a schedule message.
final class BuildScheduleMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `scheduleId`. Schedule id.
  final String scheduleId;
  /// wire: `title`. Schedule title.
  final String title;
  /// wire: `startTimeMs`. Start time in milliseconds since epoch.
  final int startTimeMs;
  /// wire: `endTimeMs`. End time in milliseconds since epoch.
  final int endTimeMs;
  /// wire: `participantUserIds`. Schedule participants.
  final List<String> participantUserIds;

  const BuildScheduleMessageRequest({
    this.conversationId = '',
    this.scheduleId = '',
    this.title = '',
    this.startTimeMs = 0,
    this.endTimeMs = 0,
    this.participantUserIds = const [],
  });
}
