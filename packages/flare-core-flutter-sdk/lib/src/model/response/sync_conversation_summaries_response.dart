// GENERATED. Do not edit by hand.
import '../entity/conversation_version.dart';

/// Conversations whose local version is missing or newer than the caller's snapshot.
final class SyncConversationSummariesResponse {
  /// wire: `changedConversations`. 
  final List<ConversationVersion> changedConversations;

  const SyncConversationSummariesResponse({
    this.changedConversations = const [],
  });
}
