// GENERATED. Do not edit by hand.
import '../entity/conversation_version.dart';

/// Request for summary sync with client-known conversation versions.
final class SyncConversationSummariesRequest {
  /// wire: `knownVersions`. 
  final List<ConversationVersion> knownVersions;

  const SyncConversationSummariesRequest({
    this.knownVersions = const [],
  });
}
