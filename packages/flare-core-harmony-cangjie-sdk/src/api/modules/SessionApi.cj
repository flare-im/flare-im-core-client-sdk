package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// SDK lifecycle, authenticated session and process-level utilities.
public interface SessionApi {
    func create(requestJson: String): String
    func initSdk(requestJson: String): Unit
    func uninit(): Unit
    func login(requestJson: String): Unit
    func prepare(requestJson: String): Unit
    func connect(requestJson: String): Unit
    func updateAccessToken(requestJson: String): Unit
    func setHeartbeatAppState(request: SetHeartbeatAppStateRequest): Unit
    func setHeartbeatNatTimeout(request: SetHeartbeatNatTimeoutRequest): Unit
    func heartbeatEffectiveInterval(): HeartbeatEffectiveIntervalResponse
    func logout(): Unit
    func dispose(): Unit
    func hardReset(): Unit
    func currentUserId(): String
    func isConnected(): BooleanResponse
    func sessionActive(): BooleanResponse
}
