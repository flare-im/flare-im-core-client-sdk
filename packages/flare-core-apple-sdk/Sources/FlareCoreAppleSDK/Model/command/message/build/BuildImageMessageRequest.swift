import Foundation

/// GENERATED. Do not edit by hand.
/// Build an image message.
public struct BuildImageMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `imageId`. Uploaded image id.
    public let imageId: String
    /// wire: `payload`. Optional rich image payload for UI preview.
    public let payload: ImageContentPayload?

    public init(conversationId: String = "", imageId: String = "", payload: ImageContentPayload? = nil) {
        self.conversationId = conversationId
        self.imageId = imageId
        self.payload = payload
    }
}
