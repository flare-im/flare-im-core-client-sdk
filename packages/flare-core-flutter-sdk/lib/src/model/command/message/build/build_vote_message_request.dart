// GENERATED. Do not edit by hand.

/// Build a vote message.
final class BuildVoteMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `voteId`. Vote id.
  final String voteId;
  /// wire: `title`. Vote title.
  final String title;
  /// wire: `options`. Vote options.
  final List<String> options;
  /// wire: `participantUserIds`. Participants allowed to vote.
  final List<String> participantUserIds;

  const BuildVoteMessageRequest({
    this.conversationId = '',
    this.voteId = '',
    this.title = '',
    this.options = const [],
    this.participantUserIds = const [],
  });
}
