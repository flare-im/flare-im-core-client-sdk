// GENERATED. Do not edit by hand.
import { LifecycleEvent } from '../model';

/** Lifecycle listener callbacks. */
export interface LifecycleEventListener {
  /** SDK initialization has started. */
  onInitializing?(event: LifecycleEvent): void;
  /** SDK initialization completed successfully. */
  onInitialized?(event: LifecycleEvent): void;
  /** SDK initialization failed. */
  onInitFailed?(event: LifecycleEvent): void;
  /** SDK login completed successfully. */
  onLoginSucceeded?(event: LifecycleEvent): void;
  /** SDK login failed. */
  onLoginFailed?(event: LifecycleEvent): void;
  /** The current SDK session logged out. */
  onLoggedOut?(event: LifecycleEvent): void;
  /** The SDK client has been disposed. */
  onDisposed?(event: LifecycleEvent): void;
}
