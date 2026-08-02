import Foundation

/// GENERATED. Do not edit by hand.
/// Build an audio message.
public struct BuildAudioMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `audioId`. Uploaded audio id.
    public let audioId: String
    /// wire: `payload`. Optional audio payload.
    public let payload: AudioContentPayload?

    public init(conversationId: String = "", audioId: String = "", payload: AudioContentPayload? = nil) {
        self.conversationId = conversationId
        self.audioId = audioId
        self.payload = payload
    }
}
