package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.listener.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.

public class DefaultEventsApi <: EventsApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func subscribeEvents(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.eventSubscribe, requestJson: wireEncodeRequest(requestJson))
    }

    public func subscribeEventsBatch(requestJson: String): String {
        return bridge.invoke(descriptor: NativeCallMap.eventSubscribeBatch, requestJson: wireEncodeRequest(requestJson))
    }

    public func unsubscribe(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.eventUnsubscribe, requestJson: wireEncodeRequest(requestJson))
    }

    public func unsubscribeAll(): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.eventUnsubscribeAll, requestJson: wireEncodeRequest("{}"))
    }

}
