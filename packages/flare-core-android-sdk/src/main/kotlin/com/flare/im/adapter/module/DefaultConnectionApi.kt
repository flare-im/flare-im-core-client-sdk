package com.flare.im.adapter.module

import com.flare.im.adapter.codec.*
import com.flare.im.api.ConnectionState
import com.flare.im.api.connection.ConnectionApi
import com.flare.im.contract.NativeBridge
import com.flare.im.contract.NativeCallMap
import com.flare.im.model.command.NetworkChangeRequest
import com.flare.im.model.response.NetworkChangeResponse

/** GENERATED. Do not edit by hand. */
class DefaultConnectionApi(
    private val bridge: NativeBridge,
) : ConnectionApi {

    override suspend fun getConnectionState(): ConnectionState {
        return invokeConnectionState(bridge, NativeCallMap.CONNECTION_GET_STATE)
    }

    override suspend fun disconnect(): Unit {
        invokeUnit(bridge, NativeCallMap.CONNECTION_DISCONNECT)
    }

    override suspend fun notifyNetworkChange(request: NetworkChangeRequest): NetworkChangeResponse {
        return networkChangeResponseFromJson(invokeMap(bridge, NativeCallMap.CONNECTION_NOTIFY_NETWORK_CHANGE, networkChangeRequestToMap(request)))
    }
}
