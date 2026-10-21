// GENERATED. Do not edit by hand.

/// Generic safe plugin message over the existing AppCard envelope.
final class BuildPluginMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `payload`. Validated generic plugin message envelope defined by flare-plugin-protocol.
  final Map<String, Object?> payload;

  const BuildPluginMessageRequest({
    this.conversationId = '',
    this.payload = const {},
  });
}
