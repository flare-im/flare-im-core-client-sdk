// GENERATED. Do not edit by hand.
// Module API: `session` — SDK lifecycle, authenticated session and process-level utilities.
import '../../model/model.dart';

/// SDK lifecycle, authenticated session and process-level utilities.
abstract interface class SessionApi {
  /// create maps to `flare_sdk_create` via `ffi-symbol`. Operation: `sdk.create`.
  Future<Map<String, Object?>> create(Map<String, Object?> request);
  /// init maps to `flare_sdk_init` via `ffi-symbol`. Operation: `sdk.init`.
  Future<void> init(Map<String, Object?> request);
  /// uninit maps to `flare_sdk_uninit` via `ffi-symbol`. Operation: `sdk.uninit`.
  Future<void> uninit();
  /// login maps to `flare_sdk_login` via `ffi-symbol`. Operation: `sdk.login`.
  Future<void> login(Map<String, Object?> request);
  /// prepare maps to `flare_sdk_prepare` via `ffi-symbol`. Operation: `sdk.prepare`.
  Future<void> prepare(Map<String, Object?> request);
  /// connect maps to `flare_sdk_connect` via `ffi-symbol`. Operation: `sdk.connect`.
  Future<void> connect(Map<String, Object?> request);
  /// updateAccessToken maps to `flare_sdk_update_access_token` via `ffi-symbol`. Operation: `sdk.update_access_token`.
  Future<void> updateAccessToken(Map<String, Object?> request);
  /// setHeartbeatAppState maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sdk.set_heartbeat_app_state`.
  Future<void> setHeartbeatAppState(SetHeartbeatAppStateRequest request);
  /// setHeartbeatNatTimeout maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sdk.set_heartbeat_nat_timeout`.
  Future<void> setHeartbeatNatTimeout(SetHeartbeatNatTimeoutRequest request);
  /// heartbeatEffectiveInterval maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `sdk.heartbeat_effective_interval`.
  Future<HeartbeatEffectiveIntervalResponse> heartbeatEffectiveInterval();
  /// logout maps to `flare_sdk_logout` via `ffi-symbol`. Operation: `sdk.logout`.
  Future<void> logout();
  /// dispose maps to `flare_sdk_release` via `ffi-symbol`. Operation: `sdk.dispose`.
  Future<void> dispose();
  /// hardReset maps to `flare_sdk_hard_reset` via `ffi-symbol`. Operation: `sdk.hard_reset`.
  Future<void> hardReset();
  /// currentUserId maps to `flare_sdk_current_user_id` via `ffi-symbol`. Operation: `sdk.current_user_id`.
  Future<Map<String, Object?>> currentUserId();
  /// isConnected maps to `flare_sdk_is_connected` via `ffi-symbol`. Operation: `sdk.is_connected`.
  Future<bool> isConnected();
  /// sessionActive maps to `flare_sdk_session_active` via `ffi-symbol`. Operation: `sdk.session_active`.
  Future<bool> sessionActive();
}
