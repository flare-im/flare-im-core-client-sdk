// GENERATED. Do not edit by hand.

/// 
final class PluginCommandRequest {
  /// wire: `payload`. prepare: slot + command; pending: slot; submit/acknowledge: slot + commandId. Scope is inferred from the active SDK session.
  final Map<String, Object?> payload;

  const PluginCommandRequest({
    this.payload = const {},
  });
}
