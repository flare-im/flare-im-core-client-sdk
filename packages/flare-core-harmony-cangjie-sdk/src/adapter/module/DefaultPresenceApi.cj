package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public class DefaultPresenceApi <: PresenceApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func getUserPresence(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.presenceGet, requestJson: wireEncodeRequest(requestJson))
    }

    public func batchGetUserPresence(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.presenceBatchGet, requestJson: wireEncodeRequest(requestJson))
    }

    public func subscribeUserPresence(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.presenceSubscribe, requestJson: wireEncodeRequest(requestJson))
    }
}
