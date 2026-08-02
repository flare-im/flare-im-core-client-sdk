// GENERATED. Do not edit by hand.

/// Typed request for updating the current user's synced conversation draft.
final class UpdateConversationDraftRequest {
  /// wire: `conversationId`. Conversation id whose draft is being updated.
  final String conversationId;
  /// wire: `draft`. Draft text. Omit or set null to clear the draft.
  final String? draft;

  const UpdateConversationDraftRequest({
    this.conversationId = '',
    this.draft,
  });
}
