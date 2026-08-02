import Foundation

/// GENERATED. Do not edit by hand.
/// Runtime app visibility update for adaptive heartbeat scheduling.
public struct SetHeartbeatAppStateRequest: Codable, Sendable {
    /// wire: `appState`. Current application visibility state.
    public let appState: HeartbeatAppState

    public init(appState: HeartbeatAppState) {
        self.appState = appState
    }
}
