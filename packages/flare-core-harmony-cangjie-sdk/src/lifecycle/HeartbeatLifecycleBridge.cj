package flare_core_harmony_cangjie_sdk.lifecycle

import flare_core_harmony_cangjie_sdk.api.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public class HeartbeatLifecycleBridge {
    private let client: FlareImClient

    public init(client: FlareImClient) {
        this.client = client
    }

    public func onShow(): Unit {
        setForeground()
    }

    public func onHide(): Unit {
        setBackground()
    }

    public func setForeground(): Unit {
        client.setHeartbeatAppState(SetHeartbeatAppStateRequest(appState: HeartbeatAppState.Foreground))
    }

    public func setBackground(): Unit {
        client.setHeartbeatAppState(SetHeartbeatAppStateRequest(appState: HeartbeatAppState.Background))
    }
}
