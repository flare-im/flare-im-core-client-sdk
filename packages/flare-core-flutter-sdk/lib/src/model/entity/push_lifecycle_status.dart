// GENERATED. Do not edit by hand.

/// PushLifecycleStatus
final class PushLifecycleStatus {
  /// wire: `configuredProviders`. Number of OS providers configured in memory.
  final int configuredProviders;
  /// wire: `lastError`. Fixed safe error category; no token, URL, bearer or driver detail.
  final String? lastError;
  /// wire: `pendingRevocations`. Unresolved revoke intents, including writes with an unknown result.
  final int pendingRevocations;
  /// wire: `registeredProviders`. Providers confirmed for the current session, not vendor delivery.
  final int registeredProviders;
  /// wire: `state`. disabled, waitingForSession, waitingForToken, pending or registered.
  final String state;

  const PushLifecycleStatus({
    this.configuredProviders = 0,
    this.lastError,
    this.pendingRevocations = 0,
    this.registeredProviders = 0,
    this.state = '',
  });
}
