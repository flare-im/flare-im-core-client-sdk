// GENERATED. Do not edit by hand.
import '../../../content/image_group_content_payload.dart';

/// Build an image group message.
final class BuildImageGroupMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `payload`. Image group payload.
  final ImageGroupContentPayload payload;

  const BuildImageGroupMessageRequest({
    this.conversationId = '',
    required this.payload,
  });
}
