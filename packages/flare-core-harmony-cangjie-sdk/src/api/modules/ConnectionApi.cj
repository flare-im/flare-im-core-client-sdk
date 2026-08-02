package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Connection state and manual network lifecycle.
public interface ConnectionApi {
    func getConnectionState(): ConnectionState
    func disconnect(): Unit
    func notifyNetworkChange(request: NetworkChangeRequest): NetworkChangeResponse
}
