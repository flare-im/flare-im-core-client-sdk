import Foundation

/// GENERATED. Do not edit by hand.
/// Video message payload.
public struct VideoContentPayload: Codable, Sendable {
    /// wire: `videoId`. Uploaded video id.
    public let videoId: String?
    /// wire: `source`. Video source.
    public let source: MediaSourceInfo?
    /// wire: `cover`. Cover image.
    public let cover: MediaSourceInfo?
    /// wire: `description`. Caption.
    public let description: String?

    public init(videoId: String? = nil, source: MediaSourceInfo? = nil, cover: MediaSourceInfo? = nil, description: String? = nil) {
        self.videoId = videoId
        self.source = source
        self.cover = cover
        self.description = description
    }
}
