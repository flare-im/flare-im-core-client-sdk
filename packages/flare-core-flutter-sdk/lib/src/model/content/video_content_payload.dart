// GENERATED. Do not edit by hand.
import '../media/media_source_info.dart';

/// Video message payload.
final class VideoContentPayload {
  /// wire: `videoId`. Uploaded video id.
  final String? videoId;
  /// wire: `source`. Video source.
  final MediaSourceInfo? source;
  /// wire: `cover`. Cover image.
  final MediaSourceInfo? cover;
  /// wire: `description`. Caption.
  final String? description;

  const VideoContentPayload({
    this.videoId,
    this.source,
    this.cover,
    this.description,
  });
}
