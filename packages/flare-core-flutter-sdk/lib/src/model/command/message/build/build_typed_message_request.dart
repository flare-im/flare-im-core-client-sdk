// GENERATED. Do not edit by hand.
import '../../../catalog/message_build_op.dart';

/// Generic typed build request used by composer helpers.
final class BuildTypedMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `op`. Build operation.
  final MessageBuildOp op;
  /// wire: `data`. Operation-specific payload; prefer typed buildXxx requests.
  final Map<String, Object?>? data;

  const BuildTypedMessageRequest({
    this.conversationId = '',
    required this.op,
    this.data,
  });
}
