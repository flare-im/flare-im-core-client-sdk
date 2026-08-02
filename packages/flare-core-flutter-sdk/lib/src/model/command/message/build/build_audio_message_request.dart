// GENERATED. Do not edit by hand.
import '../../../content/audio_content_payload.dart';

/// Build an audio message.
final class BuildAudioMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `audioId`. Uploaded audio id.
  final String audioId;
  /// wire: `payload`. Optional audio payload.
  final AudioContentPayload? payload;

  const BuildAudioMessageRequest({
    this.conversationId = '',
    this.audioId = '',
    this.payload,
  });
}
