import Foundation

/// GENERATED. Do not edit by hand.
/// Build an image group message.
public struct BuildImageGroupMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `payload`. Image group payload.
    public let payload: ImageGroupContentPayload

    public init(conversationId: String = "", payload: ImageGroupContentPayload) {
        self.conversationId = conversationId
        self.payload = payload
    }
}
