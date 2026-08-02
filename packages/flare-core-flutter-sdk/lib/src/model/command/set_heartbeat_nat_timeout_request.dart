// GENERATED. Do not edit by hand.

/// Runtime NAT timeout hint for adaptive heartbeat scheduling. Omit or pass null to clear the hint.
final class SetHeartbeatNatTimeoutRequest {
  /// wire: `natTimeoutSecs`. Observed NAT idle timeout in seconds.
  final int? natTimeoutSecs;

  const SetHeartbeatNatTimeoutRequest({
    this.natTimeoutSecs,
  });
}
