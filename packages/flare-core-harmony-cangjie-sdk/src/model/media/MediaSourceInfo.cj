package flare_core_harmony_cangjie_sdk.model.media

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Image/video/audio/file source descriptor (uuid, url, dimensions).
public class MediaSourceInfo {
    // wire: `uuid`. Optional. Stable media uuid.
    public let uuid: ?String
    // wire: `imageId`. Optional. Image id when applicable.
    public let imageId: ?String
    // wire: `url`. Optional. Resolved URL.
    public let url: ?String
    // wire: `mimeType`. Optional. MIME type.
    public let mimeType: ?String
    // wire: `size`. Optional. Byte size.
    public let size: ?UInt64
    // wire: `width`. Optional. Width in pixels.
    public let width: ?Int32
    // wire: `height`. Optional. Height in pixels.
    public let height: ?Int32
    // wire: `blurhash`. Optional. Blurhash placeholder for image previews.
    public let blurhash: ?String
    // wire: `durationMs`. Optional. Duration for audio/video.
    public let durationMs: ?Int32

    public init(uuid!: ?String, imageId!: ?String, url!: ?String, mimeType!: ?String, size!: ?UInt64, width!: ?Int32, height!: ?Int32, blurhash!: ?String, durationMs!: ?Int32) {
        this.uuid = uuid
        this.imageId = imageId
        this.url = url
        this.mimeType = mimeType
        this.size = size
        this.width = width
        this.height = height
        this.blurhash = blurhash
        this.durationMs = durationMs
    }
}
