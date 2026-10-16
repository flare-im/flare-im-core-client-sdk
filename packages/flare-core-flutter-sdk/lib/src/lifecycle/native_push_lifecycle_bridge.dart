import '../api/client.dart';
import '../model/entity/push_lifecycle_status.dart';
import '../model/entity/push_token_input.dart';
import '../model/command/clear_push_token_request.dart';
import '../model/command/set_push_permission_request.dart';

/// Thin OS/plugin callback adapter. Rust owns identity, CAS, persistence,
/// cancellation and retry policy. Never persist a bearer or OS token here.
///
/// Call normal client.logout/login for exit/account changes. Those operations
/// detach/attach the Rust lifecycle; no second Flutter registration state exists.
/// Observe returned pending status; a completed callback is not vendor delivery.
final class NativePushLifecycleBridge {
  const NativePushLifecycleBridge(this._client);

  final FlareImClient _client;

  Future<PushLifecycleStatus> onTokenRefresh(PushTokenInput token) =>
      _client.updatePushToken(token);

  Future<PushLifecycleStatus> onTokenInvalidated(String provider) =>
      _client.clearPushToken(ClearPushTokenRequest(provider: provider));

  /// Forward the current OS permission, including initial denial/revocation.
  /// Do not queue this behind token callbacks: core can retire an in-flight PUT.
  Future<PushLifecycleStatus> onPermissionChanged(bool allowed) =>
      _client.setPushPermission(SetPushPermissionRequest(allowed: allowed));

  Future<PushLifecycleStatus> onResume() => _client.reconcilePush();

  Future<PushLifecycleStatus> onNetworkAvailable() => _client.reconcilePush();
}
