package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Core observable message/conversation views.
public interface ViewsApi {
    func openTimeline(request: OpenTimelineViewRequest): ViewOpenResponse
    func loadOlderTimeline(request: LoadOlderTimelineViewRequest): ViewLoadOlderResponse
    func openConversationList(request: OpenConversationListViewRequest): ViewOpenResponse
    func close(request: CloseViewRequest): CloseViewResponse
}
