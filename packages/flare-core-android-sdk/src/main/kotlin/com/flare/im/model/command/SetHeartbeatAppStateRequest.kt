package com.flare.im.model.command

import com.flare.im.model.entity.HeartbeatAppState

/** GENERATED. Do not edit by hand. */
/** Runtime app visibility update for adaptive heartbeat scheduling. */
data class SetHeartbeatAppStateRequest(
    /** wire: `appState`. Current application visibility state. */
    val appState: HeartbeatAppState,
)
