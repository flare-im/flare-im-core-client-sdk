import Foundation

/// GENERATED. Do not edit by hand.
/// Generic typed build request used by composer helpers.
public struct BuildTypedMessageRequest: Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `op`. Build operation.
    public let op: MessageBuildOp
    /// wire: `data`. Operation-specific payload; prefer typed buildXxx requests.
    public let data: [String: AnySendable]?

    public init(conversationId: String = "", op: MessageBuildOp, data: [String: AnySendable]? = nil) {
        self.conversationId = conversationId
        self.op = op
        self.data = data
    }
}
