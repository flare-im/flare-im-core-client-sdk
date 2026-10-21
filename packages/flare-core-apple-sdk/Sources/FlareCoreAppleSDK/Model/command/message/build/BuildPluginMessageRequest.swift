import Foundation

/// GENERATED. Do not edit by hand.
/// Generic safe plugin message over the existing AppCard envelope.
public struct BuildPluginMessageRequest: Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `payload`. Validated generic plugin message envelope defined by flare-plugin-protocol.
    public let payload: [String: AnySendable]

    public init(conversationId: String = "", payload: [String: AnySendable] = [:]) {
        self.conversationId = conversationId
        self.payload = payload
    }
}
