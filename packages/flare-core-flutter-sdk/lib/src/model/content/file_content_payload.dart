// GENERATED. Do not edit by hand.

/// File message payload.
final class FileContentPayload {
  /// wire: `fileId`. Uploaded file id.
  final String? fileId;
  /// wire: `name`. Display name.
  final String? name;
  /// wire: `url`. Download URL.
  final String? url;
  /// wire: `mimeType`. MIME type.
  final String? mimeType;
  /// wire: `size`. Byte size.
  final int? size;

  const FileContentPayload({
    this.fileId,
    this.name,
    this.url,
    this.mimeType,
    this.size,
  });
}
