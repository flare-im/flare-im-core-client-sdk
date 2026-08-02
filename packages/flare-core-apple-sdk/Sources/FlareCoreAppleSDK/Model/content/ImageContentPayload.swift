import Foundation

/// GENERATED. Do not edit by hand.
/// Image message payload.
public struct ImageContentPayload: Codable, Sendable {
    /// wire: `imageId`. Uploaded image id.
    public let imageId: String?
    /// wire: `source`. Source descriptor.
    public let source: MediaSourceInfo?
    /// wire: `thumbnail`. Thumbnail descriptor.
    public let thumbnail: MediaSourceInfo?
    /// wire: `description`. Caption.
    public let description: String?

    public init(imageId: String? = nil, source: MediaSourceInfo? = nil, thumbnail: MediaSourceInfo? = nil, description: String? = nil) {
        self.imageId = imageId
        self.source = source
        self.thumbnail = thumbnail
        self.description = description
    }
}
