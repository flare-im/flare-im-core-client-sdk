// GENERATED. Do not edit by hand.
import { HeartbeatAppState } from '../entity/heartbeat_app_state';

/** Runtime app visibility update for adaptive heartbeat scheduling. */
export interface SetHeartbeatAppStateRequest {
  /** wire: `appState`. Current application visibility state. */
  appState: HeartbeatAppState;
}
