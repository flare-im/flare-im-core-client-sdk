/** GENERATED. Do not edit by hand. */
import type { EventCallback } from './common';
import type { CapabilityEvent } from '../model';

/** Capability listener callbacks. */
export interface CapabilityEventListener {
  /** A runtime capability or plugin availability changed. */
  onCapabilityChanged?(event: CapabilityEvent): void;
}
