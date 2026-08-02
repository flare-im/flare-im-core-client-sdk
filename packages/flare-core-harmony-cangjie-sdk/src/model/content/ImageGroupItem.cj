package flare_core_harmony_cangjie_sdk.model.content

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// One image inside an image group.
public class ImageGroupItem {
    // wire: `imageId`. Image id.
    public let imageId: String
    // wire: `url`. Optional. Resolved URL.
    public let url: ?String
    // wire: `title`. Optional. Item title.
    public let title: ?String
    // wire: `width`. Optional. Width.
    public let width: ?Int32
    // wire: `height`. Optional. Height.
    public let height: ?Int32

    public init(imageId!: String, url!: ?String, title!: ?String, width!: ?Int32, height!: ?Int32) {
        this.imageId = imageId
        this.url = url
        this.title = title
        this.width = width
        this.height = height
    }
}
