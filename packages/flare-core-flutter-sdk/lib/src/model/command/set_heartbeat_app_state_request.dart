// GENERATED. Do not edit by hand.
import '../entity/heartbeat_app_state.dart';

/// Runtime app visibility update for adaptive heartbeat scheduling.
final class SetHeartbeatAppStateRequest {
  /// wire: `appState`. Current application visibility state.
  final HeartbeatAppState appState;

  const SetHeartbeatAppStateRequest({
    required this.appState,
  });
}
