package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Capability discovery and optional plugin dispatch through capability dispatch ops.
public interface CapabilitiesApi {
    func listCapabilities(requestJson: String): String
    func listUserCapabilities(requestJson: String): String
    func dispatchCapability(requestJson: String): String
    func grantCapability(requestJson: String): Unit
    func revokeCapability(requestJson: String): Unit
    func sendCallSignal(requestJson: String): Unit
}
