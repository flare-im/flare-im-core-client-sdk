import Foundation

/// GENERATED. Do not edit by hand.
public final class HeartbeatLifecycleBridge {
    private let client: any FlareImClientProtocol

    public init(client: any FlareImClientProtocol) {
        self.client = client
    }

    public func applicationDidBecomeActive() async throws {
        try await setForeground()
    }

    public func applicationDidEnterBackground() async throws {
        try await setBackground()
    }

    public func setForeground() async throws {
        try await client.setHeartbeatAppState(SetHeartbeatAppStateRequest(appState: .foreground))
    }

    public func setBackground() async throws {
        try await client.setHeartbeatAppState(SetHeartbeatAppStateRequest(appState: .background))
    }
}
