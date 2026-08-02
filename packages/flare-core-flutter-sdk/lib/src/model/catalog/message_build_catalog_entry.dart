// GENERATED. Do not edit by hand.
import 'message_build_op.dart';
import '../common/enums/message_content_type.dart';

/// One supported quick-build operation exposed on MessageBuilderApi.
final class MessageBuildCatalogEntry {
  /// wire: `op`. Build dispatch op.
  final MessageBuildOp op;
  /// wire: `method`. Facade method name, e.g. buildText.
  final String method;
  /// wire: `requestType`. Typed request model name.
  final String requestType;
  /// wire: `contentType`. Decoded content discriminator.
  final MessageContentType contentType;
  /// wire: `messageType`. Core message type integer.
  final int messageType;
  /// wire: `summary`. Human-readable summary for UI/docs.
  final String summary;
  /// wire: `stability`. stable | beta | experimental
  final String stability;

  const MessageBuildCatalogEntry({
    required this.op,
    this.method = '',
    this.requestType = '',
    required this.contentType,
    this.messageType = 0,
    this.summary = '',
    this.stability = '',
  });
}
