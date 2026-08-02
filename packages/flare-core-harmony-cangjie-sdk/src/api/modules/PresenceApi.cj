package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Presence and input state.
public interface PresenceApi {
    func getUserPresence(requestJson: String): String
    func batchGetUserPresence(requestJson: String): String
    func subscribeUserPresence(requestJson: String): Unit
}
