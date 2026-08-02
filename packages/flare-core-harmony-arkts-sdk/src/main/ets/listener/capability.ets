// GENERATED. Do not edit by hand.
import { CapabilityEvent } from '../model';

/** Capability listener callbacks. */
export interface CapabilityEventListener {
  /** A runtime capability or plugin availability changed. */
  onCapabilityChanged?(event: CapabilityEvent): void;
}
