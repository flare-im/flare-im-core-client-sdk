// GENERATED. Do not edit by hand.

/// Currently effective heartbeat interval for diagnostics and platform observability.
final class HeartbeatEffectiveIntervalResponse {
  /// wire: `connected`. Whether a live transport is available.
  final bool connected;
  /// wire: `intervalMs`. Effective heartbeat interval in milliseconds when connected.
  final int? intervalMs;
  /// wire: `intervalSecs`. Effective heartbeat interval in seconds when connected.
  final int? intervalSecs;

  const HeartbeatEffectiveIntervalResponse({
    this.connected = false,
    this.intervalMs,
    this.intervalSecs,
  });
}
