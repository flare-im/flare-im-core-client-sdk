import Foundation

/// GENERATED. Do not edit by hand.
/// Build a file message.
public struct BuildFileMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `fileId`. Uploaded file id.
    public let fileId: String
    /// wire: `payload`. Optional file payload.
    public let payload: FileContentPayload?

    public init(conversationId: String = "", fileId: String = "", payload: FileContentPayload? = nil) {
        self.conversationId = conversationId
        self.fileId = fileId
        self.payload = payload
    }
}
