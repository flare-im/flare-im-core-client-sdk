package flare_core_harmony_cangjie_sdk.model.content

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Image group payload.
public class ImageGroupContentPayload {
    // wire: `images`. Grouped images.
    public let images: String
    // wire: `title`. Optional. Group title.
    public let title: ?String

    public init(images!: String, title!: ?String) {
        this.images = images
        this.title = title
    }
}
