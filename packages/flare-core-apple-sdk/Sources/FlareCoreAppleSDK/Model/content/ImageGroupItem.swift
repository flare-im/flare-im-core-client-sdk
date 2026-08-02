import Foundation

/// GENERATED. Do not edit by hand.
/// One image inside an image group.
public struct ImageGroupItem: Codable, Sendable {
    /// wire: `imageId`. Image id.
    public let imageId: String
    /// wire: `url`. Resolved URL.
    public let url: String?
    /// wire: `title`. Item title.
    public let title: String?
    /// wire: `width`. Width.
    public let width: Int32?
    /// wire: `height`. Height.
    public let height: Int32?

    public init(imageId: String = "", url: String? = nil, title: String? = nil, width: Int32? = nil, height: Int32? = nil) {
        self.imageId = imageId
        self.url = url
        self.title = title
        self.width = width
        self.height = height
    }
}
