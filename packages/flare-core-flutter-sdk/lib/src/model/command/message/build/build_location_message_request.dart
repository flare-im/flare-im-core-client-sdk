// GENERATED. Do not edit by hand.

/// Build a location message.
final class BuildLocationMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `latitude`. Latitude.
  final double latitude;
  /// wire: `longitude`. Longitude.
  final double longitude;
  /// wire: `title`. Place title.
  final String? title;
  /// wire: `address`. Address.
  final String? address;

  const BuildLocationMessageRequest({
    this.conversationId = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.title,
    this.address,
  });
}
