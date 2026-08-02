package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Runtime app visibility update for adaptive heartbeat scheduling.
public class SetHeartbeatAppStateRequest {
    // wire: `appState`. Current application visibility state.
    public let appState: HeartbeatAppState

    public init(appState!: HeartbeatAppState) {
        this.appState = appState
    }
}
