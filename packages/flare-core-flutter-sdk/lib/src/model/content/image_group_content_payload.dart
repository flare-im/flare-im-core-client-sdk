// GENERATED. Do not edit by hand.
import 'image_group_item.dart';

/// Image group payload.
final class ImageGroupContentPayload {
  /// wire: `images`. Grouped images.
  final List<ImageGroupItem> images;
  /// wire: `title`. Group title.
  final String? title;

  const ImageGroupContentPayload({
    this.images = const [],
    this.title,
  });
}
