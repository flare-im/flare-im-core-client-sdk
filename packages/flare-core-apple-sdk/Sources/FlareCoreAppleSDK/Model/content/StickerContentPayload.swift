import Foundation

/// GENERATED. Do not edit by hand.
/// Sticker message payload.
public struct StickerContentPayload: Codable, Sendable {
    /// wire: `stickerId`. Sticker id.
    public let stickerId: String
    /// wire: `packageId`. Sticker package id.
    public let packageId: String?
    /// wire: `url`. Sticker URL.
    public let url: String?
    /// wire: `width`. Width.
    public let width: Int32?
    /// wire: `height`. Height.
    public let height: Int32?
    /// wire: `format`. webp/gif/png.
    public let format: String?

    public init(stickerId: String = "", packageId: String? = nil, url: String? = nil, width: Int32? = nil, height: Int32? = nil, format: String? = nil) {
        self.stickerId = stickerId
        self.packageId = packageId
        self.url = url
        self.width = width
        self.height = height
        self.format = format
    }
}
