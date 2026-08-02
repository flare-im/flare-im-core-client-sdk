// GENERATED. Do not edit by hand.
import '../media/media_source_info.dart';

/// Image message payload.
final class ImageContentPayload {
  /// wire: `imageId`. Uploaded image id.
  final String? imageId;
  /// wire: `source`. Source descriptor.
  final MediaSourceInfo? source;
  /// wire: `thumbnail`. Thumbnail descriptor.
  final MediaSourceInfo? thumbnail;
  /// wire: `description`. Caption.
  final String? description;

  const ImageContentPayload({
    this.imageId,
    this.source,
    this.thumbnail,
    this.description,
  });
}
