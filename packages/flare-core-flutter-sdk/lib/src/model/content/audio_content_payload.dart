// GENERATED. Do not edit by hand.
import '../media/media_source_info.dart';

/// Audio message payload.
final class AudioContentPayload {
  /// wire: `audioId`. Uploaded audio id.
  final String? audioId;
  /// wire: `source`. Audio source.
  final MediaSourceInfo? source;
  /// wire: `durationMs`. Duration.
  final int? durationMs;

  const AudioContentPayload({
    this.audioId,
    this.source,
    this.durationMs,
  });
}
