// GENERATED. Do not edit by hand.

/// Sticker message payload.
final class StickerContentPayload {
  /// wire: `stickerId`. Sticker id.
  final String stickerId;
  /// wire: `packageId`. Sticker package id.
  final String? packageId;
  /// wire: `url`. Sticker URL.
  final String? url;
  /// wire: `width`. Width.
  final int? width;
  /// wire: `height`. Height.
  final int? height;
  /// wire: `format`. webp/gif/png.
  final String? format;

  const StickerContentPayload({
    this.stickerId = '',
    this.packageId,
    this.url,
    this.width,
    this.height,
    this.format,
  });
}
