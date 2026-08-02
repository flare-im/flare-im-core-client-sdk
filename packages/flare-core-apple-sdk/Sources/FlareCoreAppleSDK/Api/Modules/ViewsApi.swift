import Foundation

/// GENERATED. Do not edit by hand.
/// Core observable message/conversation views.
public protocol ViewsApiProtocol: AnyObject {
    func openTimeline(_ request: OpenTimelineViewRequest) async throws -> ViewOpenResponse
    func loadOlderTimeline(_ request: LoadOlderTimelineViewRequest) async throws -> ViewLoadOlderResponse
    func openConversationList(_ request: OpenConversationListViewRequest) async throws -> ViewOpenResponse
    func close(_ request: CloseViewRequest) async throws -> CloseViewResponse
}
