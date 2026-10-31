import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultViewsApi: ViewsApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func openTimeline(_ request: OpenTimelineViewRequest) async throws -> ViewOpenResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewTimelineOpen, request: openTimelineViewRequestToMap(request))
        return try viewOpenResponseFromJson(raw)
    }

    public func loadOlderTimeline(_ request: LoadOlderTimelineViewRequest) async throws -> TimelineViewPageResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewTimelineLoadOlder, request: loadOlderTimelineViewRequestToMap(request))
        return try timelineViewPageResponseFromJson(raw)
    }

    public func loadNewerTimeline(_ request: LoadNewerTimelineViewRequest) async throws -> TimelineViewPageResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewTimelineLoadNewer, request: loadNewerTimelineViewRequestToMap(request))
        return try timelineViewPageResponseFromJson(raw)
    }

    public func jumpToLatestTimeline(_ request: TimelineViewRequest) async throws -> TimelineViewPageResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewTimelineJumpToLatest, request: timelineViewRequestToMap(request))
        return try timelineViewPageResponseFromJson(raw)
    }

    public func timelineSnapshot(_ request: TimelineViewRequest) async throws -> ViewOpenResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewTimelineSnapshot, request: timelineViewRequestToMap(request))
        return try viewOpenResponseFromJson(raw)
    }

    public func openConversationList(_ request: OpenConversationListViewRequest) async throws -> ViewOpenResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewConversationListOpen, request: openConversationListViewRequestToMap(request))
        return try viewOpenResponseFromJson(raw)
    }

    public func close(_ request: CloseViewRequest) async throws -> CloseViewResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.viewClose, request: closeViewRequestToMap(request))
        return try closeViewResponseFromJson(raw)
    }
}
