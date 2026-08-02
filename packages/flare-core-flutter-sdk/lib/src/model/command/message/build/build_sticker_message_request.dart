// GENERATED. Do not edit by hand.
import '../../../content/sticker_content_payload.dart';

/// Build a sticker message.
final class BuildStickerMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `stickerId`. Sticker id.
  final String stickerId;
  /// wire: `packageId`. Sticker package id.
  final String? packageId;
  /// wire: `payload`. Optional sticker payload.
  final StickerContentPayload? payload;

  const BuildStickerMessageRequest({
    this.conversationId = '',
    this.stickerId = '',
    this.packageId,
    this.payload,
  });
}
