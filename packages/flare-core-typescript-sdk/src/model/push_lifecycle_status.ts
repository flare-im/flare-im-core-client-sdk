/** GENERATED. Do not edit by hand. */

/** PushLifecycleStatus */
export interface PushLifecycleStatus {
  /** wire: `configuredProviders`. Number of OS providers configured in memory. */
  configuredProviders: number;
  /** wire: `lastError`. Fixed safe error category; no token, URL, bearer or driver detail. */
  lastError?: string;
  /** wire: `pendingRevocations`. Unresolved revoke intents, including writes with an unknown result. */
  pendingRevocations: number;
  /** wire: `registeredProviders`. Providers confirmed for the current session, not vendor delivery. */
  registeredProviders: number;
  /** wire: `state`. disabled, waitingForSession, waitingForToken, pending or registered. */
  state: string;
}
