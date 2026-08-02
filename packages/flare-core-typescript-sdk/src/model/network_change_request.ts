/** GENERATED. Do not edit by hand. */
import type { NetworkInterfaceKind } from './network_interface_kind';

/** Platform network-change notification used to trigger active reconnect. */
export interface NetworkChangeRequest {
  /** wire: `available`. Whether a network route is currently available. Omitted means available. */
  available?: boolean;
  /** wire: `interface`. Standardized platform network interface hint. */
  interface?: NetworkInterfaceKind;
  /** wire: `expensive`. Whether the active route is considered expensive by the platform. */
  expensive?: boolean;
  /** wire: `metered`. Whether the active route is metered. */
  metered?: boolean;
  /** wire: `reason`. Optional platform reason string for diagnostics. */
  reason?: string;
}
