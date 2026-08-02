import Foundation

/// GENERATED. Do not edit by hand.
/// Audio message payload.
public struct AudioContentPayload: Codable, Sendable {
    /// wire: `audioId`. Uploaded audio id.
    public let audioId: String?
    /// wire: `source`. Audio source.
    public let source: MediaSourceInfo?
    /// wire: `durationMs`. Duration.
    public let durationMs: Int32?

    public init(audioId: String? = nil, source: MediaSourceInfo? = nil, durationMs: Int32? = nil) {
        self.audioId = audioId
        self.source = source
        self.durationMs = durationMs
    }
}
