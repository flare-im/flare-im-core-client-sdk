// GENERATED. Do not edit by hand.
// Module API: `capabilities` — Capability discovery and optional plugin dispatch through capability dispatch ops.

/// Capability discovery and optional plugin dispatch through capability dispatch ops.
abstract interface class CapabilitiesApi {
  /// listCapabilities maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_list`. Operation: `capability.list`.
  Future<Map<String, Object?>> listCapabilities(Map<String, Object?> request);
  /// listUserCapabilities maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_list_user`. Operation: `capability.list_user`.
  Future<Map<String, Object?>> listUserCapabilities(Map<String, Object?> request);
  /// dispatchCapability maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_dispatch`. Operation: `capability.dispatch`.
  Future<Map<String, Object?>> dispatchCapability(Map<String, Object?> request);
  /// grantCapability maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_grant`. Operation: `capability.grant`.
  Future<void> grantCapability(Map<String, Object?> request);
  /// revokeCapability maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_revoke`. Operation: `capability.revoke`.
  Future<void> revokeCapability(Map<String, Object?> request);
  /// sendCallSignal maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `send_call_signal`. Operation: `capability.send_call_signal`.
  Future<void> sendCallSignal(Map<String, Object?> request);
}
