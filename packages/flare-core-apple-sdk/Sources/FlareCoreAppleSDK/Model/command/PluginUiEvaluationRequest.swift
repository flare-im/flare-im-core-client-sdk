import Foundation

/// GENERATED. Do not edit by hand.
/// 
public struct PluginUiEvaluationRequest: Sendable {
    /// wire: `payload`. Typed UI evaluation envelope defined by the shared UI protocol. presentPluginMessage, invokePluginAction and pluginDetail accept an optional messageId (server id or clientMsgId) of the message the card belongs to: the card resolves over the shared and local state layers stored on that message, and invoke stores a successful operation's data.sharedState and data.messageState on it. invokePluginAction also takes formValues and selection; pluginDetail also takes cursor and previous for the next page of a paged detail, and refresh with previous to re-read a shown sheet keeping the pages it had loaded. pluginPage takes {pluginId, page, platform, locale?, arguments?, filters?, cursor?, previous?, refresh?}; invokePluginAction takes page {pluginId, page}, data and row {key, input} instead of message for a page action.
    public let payload: [String: AnySendable]

    public init(payload: [String: AnySendable] = [:]) {
        self.payload = payload
    }
}
