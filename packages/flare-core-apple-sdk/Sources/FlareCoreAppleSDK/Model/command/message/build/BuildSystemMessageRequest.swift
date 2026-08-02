import Foundation

/// GENERATED. Do not edit by hand.
/// Build a system message.
public struct BuildSystemMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `eventKind`. System event kind.
    public let eventKind: String
    /// wire: `body`. System event body.
    public let body: String

    public init(conversationId: String = "", eventKind: String = "", body: String = "") {
        self.conversationId = conversationId
        self.eventKind = eventKind
        self.body = body
    }
}
