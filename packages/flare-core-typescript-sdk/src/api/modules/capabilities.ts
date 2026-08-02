/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `capabilities` — Capability discovery and optional plugin dispatch through capability dispatch ops.
 */
import type { DispatchCapabilityRequest, DispatchCapabilityResponse, GrantCapabilityRequest, ListCapabilitiesRequest, ListCapabilitiesResponse, ListUserCapabilitiesRequest, ListUserCapabilitiesResponse, RevokeCapabilityRequest, SendCallSignalRequest } from '../types';

/** Capability discovery and optional plugin dispatch through capability dispatch ops. */
export interface CapabilitiesApi {
  /** listCapabilities maps to `flare_capability_dispatch_json`, dispatch op `capability_list`. Operation: `capability.list`. */
  listCapabilities(request: ListCapabilitiesRequest): Promise<ListCapabilitiesResponse>;
  /** listUserCapabilities maps to `flare_capability_dispatch_json`, dispatch op `capability_list_user`. Operation: `capability.list_user`. */
  listUserCapabilities(request: ListUserCapabilitiesRequest): Promise<ListUserCapabilitiesResponse>;
  /** dispatchCapability maps to `flare_capability_dispatch_json`, dispatch op `capability_dispatch`. Operation: `capability.dispatch`. */
  dispatchCapability(request: DispatchCapabilityRequest): Promise<DispatchCapabilityResponse>;
  /** grantCapability maps to `flare_capability_dispatch_json`, dispatch op `capability_grant`. Operation: `capability.grant`. */
  grantCapability(request: GrantCapabilityRequest): Promise<void>;
  /** revokeCapability maps to `flare_capability_dispatch_json`, dispatch op `capability_revoke`. Operation: `capability.revoke`. */
  revokeCapability(request: RevokeCapabilityRequest): Promise<void>;
  /** sendCallSignal maps to `flare_capability_dispatch_json`, dispatch op `send_call_signal`. Operation: `capability.send_call_signal`. */
  sendCallSignal(request: SendCallSignalRequest): Promise<void>;
}
