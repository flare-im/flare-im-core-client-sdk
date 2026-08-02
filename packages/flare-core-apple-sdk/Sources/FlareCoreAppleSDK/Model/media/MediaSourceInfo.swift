import Foundation

/// GENERATED. Do not edit by hand.
/// Image/video/audio/file source descriptor (uuid, url, dimensions).
public struct MediaSourceInfo: Codable, Sendable {
    /// wire: `uuid`. Stable media uuid.
    public let uuid: String?
    /// wire: `imageId`. Image id when applicable.
    public let imageId: String?
    /// wire: `url`. Resolved URL.
    public let url: String?
    /// wire: `mimeType`. MIME type.
    public let mimeType: String?
    /// wire: `size`. Byte size.
    public let size: UInt64?
    /// wire: `width`. Width in pixels.
    public let width: Int32?
    /// wire: `height`. Height in pixels.
    public let height: Int32?
    /// wire: `blurhash`. Blurhash placeholder for image previews.
    public let blurhash: String?
    /// wire: `durationMs`. Duration for audio/video.
    public let durationMs: Int32?

    public init(uuid: String? = nil, imageId: String? = nil, url: String? = nil, mimeType: String? = nil, size: UInt64? = nil, width: Int32? = nil, height: Int32? = nil, blurhash: String? = nil, durationMs: Int32? = nil) {
        self.uuid = uuid
        self.imageId = imageId
        self.url = url
        self.mimeType = mimeType
        self.size = size
        self.width = width
        self.height = height
        self.blurhash = blurhash
        self.durationMs = durationMs
    }
}
