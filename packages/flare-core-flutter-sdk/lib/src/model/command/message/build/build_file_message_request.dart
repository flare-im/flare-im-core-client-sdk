// GENERATED. Do not edit by hand.
import '../../../content/file_content_payload.dart';

/// Build a file message.
final class BuildFileMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `fileId`. Uploaded file id.
  final String fileId;
  /// wire: `payload`. Optional file payload.
  final FileContentPayload? payload;

  const BuildFileMessageRequest({
    this.conversationId = '',
    this.fileId = '',
    this.payload,
  });
}
