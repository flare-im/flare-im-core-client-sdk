package flare_core_harmony_cangjie_sdk.adapter

import flare_core_harmony_cangjie_sdk.contract.*
import flare_core_harmony_cangjie_sdk.api.modules.*
import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public class DefaultViewsApi <: ViewsApi {
    private let bridge: NativeBridge

    public init(bridge: NativeBridge) {
        this.bridge = bridge
    }

    public func openTimeline(request: OpenTimelineViewRequest): ViewOpenResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewTimelineOpen, requestJson: wireEncodeRequest(openTimelineViewRequestToJson(request)))
    }

    public func loadOlderTimeline(request: LoadOlderTimelineViewRequest): TimelineViewPageResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewTimelineLoadOlder, requestJson: wireEncodeRequest(loadOlderTimelineViewRequestToJson(request)))
    }

    public func loadNewerTimeline(request: LoadNewerTimelineViewRequest): TimelineViewPageResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewTimelineLoadNewer, requestJson: wireEncodeRequest(loadNewerTimelineViewRequestToJson(request)))
    }

    public func jumpToLatestTimeline(request: TimelineViewRequest): TimelineViewPageResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewTimelineJumpToLatest, requestJson: wireEncodeRequest(timelineViewRequestToJson(request)))
    }

    public func timelineSnapshot(request: TimelineViewRequest): ViewOpenResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewTimelineSnapshot, requestJson: wireEncodeRequest(timelineViewRequestToJson(request)))
    }

    public func openConversationList(request: OpenConversationListViewRequest): ViewOpenResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewConversationListOpen, requestJson: wireEncodeRequest(openConversationListViewRequestToJson(request)))
    }

    public func close(request: CloseViewRequest): CloseViewResponse {
        return bridge.invoke(descriptor: NativeCallMap.viewClose, requestJson: wireEncodeRequest(closeViewRequestToJson(request)))
    }
}
