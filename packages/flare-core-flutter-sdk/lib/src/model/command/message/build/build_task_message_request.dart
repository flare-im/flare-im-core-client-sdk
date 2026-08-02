// GENERATED. Do not edit by hand.

/// Build a task message.
final class BuildTaskMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `taskId`. Task id.
  final String taskId;
  /// wire: `title`. Task title.
  final String title;
  /// wire: `status`. Task status.
  final String? status;
  /// wire: `participantUserIds`. Task participants.
  final List<String> participantUserIds;

  const BuildTaskMessageRequest({
    this.conversationId = '',
    this.taskId = '',
    this.title = '',
    this.status,
    this.participantUserIds = const [],
  });
}
