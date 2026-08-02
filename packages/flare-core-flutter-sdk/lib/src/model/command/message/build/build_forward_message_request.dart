// GENERATED. Do not edit by hand.
import '../../../content/forward_source_message.dart';

/// Build a forward message.
final class BuildForwardMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `merge`. Merge into one card.
  final bool? merge;
  /// wire: `title`. Forward title.
  final String title;
  /// wire: `sourceMessages`. Messages to forward.
  final List<ForwardSourceMessage> sourceMessages;

  const BuildForwardMessageRequest({
    this.conversationId = '',
    this.merge,
    this.title = '',
    this.sourceMessages = const [],
  });
}
