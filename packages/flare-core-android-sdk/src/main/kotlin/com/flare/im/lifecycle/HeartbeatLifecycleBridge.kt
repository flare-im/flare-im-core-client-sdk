package com.flare.im.lifecycle

import com.flare.im.api.FlareImClient
import com.flare.im.model.command.SetHeartbeatAppStateRequest
import com.flare.im.model.entity.HeartbeatAppState

/** GENERATED. Do not edit by hand. */
class HeartbeatLifecycleBridge(
    private val client: FlareImClient,
) {
    suspend fun onResume() {
        setForeground()
    }

    suspend fun onPause() {
        setBackground()
    }

    suspend fun setForeground() {
        client.setHeartbeatAppState(SetHeartbeatAppStateRequest(HeartbeatAppState.FOREGROUND))
    }

    suspend fun setBackground() {
        client.setHeartbeatAppState(SetHeartbeatAppStateRequest(HeartbeatAppState.BACKGROUND))
    }
}
