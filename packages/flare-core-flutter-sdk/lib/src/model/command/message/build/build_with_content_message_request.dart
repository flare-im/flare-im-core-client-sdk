// GENERATED. Do not edit by hand.
import '../../../entity/message_content.dart';

/// Build from an existing MessageContent envelope.
final class BuildWithContentMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `content`. Decoded content envelope.
  final MessageContent content;

  const BuildWithContentMessageRequest({
    this.conversationId = '',
    required this.content,
  });
}
