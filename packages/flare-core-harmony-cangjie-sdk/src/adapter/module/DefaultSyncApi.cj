package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.listener.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.

public class DefaultSyncApi <: SyncApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func syncConversationSummaries(): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.syncConversationSummaries, requestJson: wireEncodeRequest("{}"))
    }

    public func syncConversationSummariesWithVersions(request: SyncConversationSummariesRequest): SyncConversationSummariesResponse {
        let raw = bridge.invoke(descriptor: NativeCallMap.syncConversationSummariesWithVersions, requestJson: wireEncodeRequest(syncConversationSummariesRequestToJson(request)))
        return syncConversationSummariesResponseFromJson(raw)
    }

    public func syncConversation(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.syncConversation, requestJson: wireEncodeRequest(requestJson))
    }

    public func syncMessages(requestJson: String): Unit {
        let _ignored = bridge.invoke(descriptor: NativeCallMap.syncMessages, requestJson: wireEncodeRequest(requestJson))
    }


}
