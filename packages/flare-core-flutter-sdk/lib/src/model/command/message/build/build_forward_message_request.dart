// GENERATED. Do not edit by hand.
import '../../../entity/message.dart';

/// Build a forward message.
final class BuildForwardMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `merge`. Merge into one card.
  final bool? merge;
  /// wire: `title`. Forward title.
  final String title;
  /// wire: `sourceMessages`. Messages to forward. Full messages, not id stubs: the forward payload embeds the original content, so the core needs content/senderId/conversationId of each source.
  final List<Message> sourceMessages;

  const BuildForwardMessageRequest({
    this.conversationId = '',
    this.merge,
    this.title = '',
    this.sourceMessages = const [],
  });
}
