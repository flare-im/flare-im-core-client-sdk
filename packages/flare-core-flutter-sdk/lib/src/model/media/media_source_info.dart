// GENERATED. Do not edit by hand.

/// Image/video/audio/file source descriptor (uuid, url, dimensions).
final class MediaSourceInfo {
  /// wire: `uuid`. Stable media uuid.
  final String? uuid;
  /// wire: `imageId`. Image id when applicable.
  final String? imageId;
  /// wire: `url`. Resolved URL.
  final String? url;
  /// wire: `mimeType`. MIME type.
  final String? mimeType;
  /// wire: `size`. Byte size.
  final int? size;
  /// wire: `width`. Width in pixels.
  final int? width;
  /// wire: `height`. Height in pixels.
  final int? height;
  /// wire: `blurhash`. Blurhash placeholder for image previews.
  final String? blurhash;
  /// wire: `durationMs`. Duration for audio/video.
  final int? durationMs;

  const MediaSourceInfo({
    this.uuid,
    this.imageId,
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.blurhash,
    this.durationMs,
  });
}
