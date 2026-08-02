// GENERATED. Do not edit by hand.
import '../../../content/image_content_payload.dart';

/// Build an image message.
final class BuildImageMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `imageId`. Uploaded image id.
  final String imageId;
  /// wire: `payload`. Optional rich image payload for UI preview.
  final ImageContentPayload? payload;

  const BuildImageMessageRequest({
    this.conversationId = '',
    this.imageId = '',
    this.payload,
  });
}
