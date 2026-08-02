package flare_core_harmony_cangjie_sdk.model.content

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Sticker message payload.
public class StickerContentPayload {
    // wire: `stickerId`. Sticker id.
    public let stickerId: String
    // wire: `packageId`. Optional. Sticker package id.
    public let packageId: ?String
    // wire: `url`. Optional. Sticker URL.
    public let url: ?String
    // wire: `width`. Optional. Width.
    public let width: ?Int32
    // wire: `height`. Optional. Height.
    public let height: ?Int32
    // wire: `format`. Optional. webp/gif/png.
    public let format: ?String

    public init(stickerId!: String, packageId!: ?String, url!: ?String, width!: ?Int32, height!: ?Int32, format!: ?String) {
        this.stickerId = stickerId
        this.packageId = packageId
        this.url = url
        this.width = width
        this.height = height
        this.format = format
    }
}
