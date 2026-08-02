// GENERATED. Do not edit by hand.
// Module API: `presence` — Presence and input state.

/// Presence and input state.
abstract interface class PresenceApi {
  /// getUserPresence maps to `flare_sdk_get_user_presence` via `ffi-symbol`. Operation: `presence.get`.
  Future<Map<String, Object?>> getUserPresence(Map<String, Object?> request);
  /// batchGetUserPresence maps to `flare_sdk_batch_get_user_presence` via `ffi-symbol`. Operation: `presence.batch_get`.
  Future<Map<String, Object?>> batchGetUserPresence(Map<String, Object?> request);
  /// subscribeUserPresence maps to `flare_sdk_subscribe_user_presence` via `ffi-symbol`. Operation: `presence.subscribe`.
  Future<void> subscribeUserPresence(Map<String, Object?> request);
}
