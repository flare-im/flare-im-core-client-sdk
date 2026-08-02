// GENERATED. Do not edit by hand.
import '../../../content/video_content_payload.dart';

/// Build a video message.
final class BuildVideoMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `videoId`. Uploaded video id.
  final String videoId;
  /// wire: `payload`. Optional video payload.
  final VideoContentPayload? payload;

  const BuildVideoMessageRequest({
    this.conversationId = '',
    this.videoId = '',
    this.payload,
  });
}
