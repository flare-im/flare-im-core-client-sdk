// GENERATED. Do not edit by hand.
import { CapabilityEventName } from './capability_event_name';

/** Capability/plugin notification payload. */
export interface CapabilityEvent {
  /** wire: `name`. Capability event name. */
  name: CapabilityEventName;
  /** wire: `capability`. Capability key. */
  capability?: string;
  /** wire: `reason`. Unavailable/change reason. */
  reason?: string;
}
