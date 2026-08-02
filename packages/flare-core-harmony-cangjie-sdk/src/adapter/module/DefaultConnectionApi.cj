package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public class DefaultConnectionApi <: ConnectionApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func getConnectionState(): ConnectionState {
        let raw = bridge.invoke(descriptor: NativeCallMap.connectionGetState, requestJson: wireEncodeRequest("{}"))
        return connectionStateFromWire(raw)
    }

    public func disconnect(): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.connectionDisconnect, requestJson: wireEncodeRequest("{}"))
    }

    public func notifyNetworkChange(request: NetworkChangeRequest): NetworkChangeResponse {
        let raw = bridge.invoke(descriptor: NativeCallMap.connectionNotifyNetworkChange, requestJson: wireEncodeRequest(networkChangeRequestToJson(request)))
        return networkChangeResponseFromJson(raw)
    }
}
