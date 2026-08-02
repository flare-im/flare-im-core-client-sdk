import Foundation

/// GENERATED. Do not edit by hand.
/// Build a video message.
public struct BuildVideoMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `videoId`. Uploaded video id.
    public let videoId: String
    /// wire: `payload`. Optional video payload.
    public let payload: VideoContentPayload?

    public init(conversationId: String = "", videoId: String = "", payload: VideoContentPayload? = nil) {
        self.conversationId = conversationId
        self.videoId = videoId
        self.payload = payload
    }
}
