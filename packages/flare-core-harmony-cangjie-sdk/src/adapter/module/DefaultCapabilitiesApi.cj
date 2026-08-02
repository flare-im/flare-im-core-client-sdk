package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public class DefaultCapabilitiesApi <: CapabilitiesApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func listCapabilities(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.capabilityList, requestJson: wireEncodeRequest(requestJson))
    }

    public func listUserCapabilities(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.capabilityListUser, requestJson: wireEncodeRequest(requestJson))
    }

    public func dispatchCapability(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.capabilityDispatch, requestJson: wireEncodeRequest(requestJson))
    }

    public func grantCapability(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.capabilityGrant, requestJson: wireEncodeRequest(requestJson))
    }

    public func revokeCapability(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.capabilityRevoke, requestJson: wireEncodeRequest(requestJson))
    }

    public func sendCallSignal(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.capabilitySendCallSignal, requestJson: wireEncodeRequest(requestJson))
    }
}
