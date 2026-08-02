// GENERATED. Do not edit by hand.

/** Currently effective heartbeat interval for diagnostics and platform observability. */
export interface HeartbeatEffectiveIntervalResponse {
  /** wire: `connected`. Whether a live transport is available. */
  connected: boolean;
  /** wire: `intervalMs`. Effective heartbeat interval in milliseconds when connected. */
  intervalMs?: number;
  /** wire: `intervalSecs`. Effective heartbeat interval in seconds when connected. */
  intervalSecs?: number;
}
