// GENERATED. Do not edit by hand.
import '../api/client.dart';
import '../model/command/set_heartbeat_app_state_request.dart';
import '../model/entity/heartbeat_app_state.dart';

/// Thin Flutter lifecycle bridge for adaptive heartbeat scheduling.
final class HeartbeatLifecycleBridge {
  const HeartbeatLifecycleBridge(this._client);

  final FlareImClient _client;

  Future<void> onResume() => setForeground();

  Future<void> onPause() => setBackground();

  Future<void> setForeground() => _client.setHeartbeatAppState(
        const SetHeartbeatAppStateRequest(
          appState: HeartbeatAppState.foreground,
        ),
      );

  Future<void> setBackground() => _client.setHeartbeatAppState(
        const SetHeartbeatAppStateRequest(
          appState: HeartbeatAppState.background,
        ),
      );
}
