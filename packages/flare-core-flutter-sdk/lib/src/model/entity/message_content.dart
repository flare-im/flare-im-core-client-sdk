// GENERATED. Do not edit by hand.
import '../common/enums/message_content_type.dart';

/// Decoded content envelope. Type-specific payload lives in `data` until per-content models are generated.
final class MessageContent {
  /// wire: `contentType`. Content discriminator.
  final MessageContentType contentType;
  /// wire: `data`. Content payload object.
  final Map<String, Object?> data;

  const MessageContent({
    required this.contentType,
    this.data = const {},
  });
}
