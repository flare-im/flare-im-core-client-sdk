import Foundation

/// GENERATED. Do not edit by hand.
/// Image group payload.
public struct ImageGroupContentPayload: Codable, Sendable {
    /// wire: `images`. Grouped images.
    public let images: [ImageGroupItem]
    /// wire: `title`. Group title.
    public let title: String?

    public init(images: [ImageGroupItem] = [], title: String? = nil) {
        self.images = images
        self.title = title
    }
}
