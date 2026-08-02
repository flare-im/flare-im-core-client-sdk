package flare_core_harmony_cangjie_sdk.model.content

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// File message payload.
public class FileContentPayload {
    // wire: `fileId`. Optional. Uploaded file id.
    public let fileId: ?String
    // wire: `name`. Optional. Display name.
    public let name: ?String
    // wire: `url`. Optional. Download URL.
    public let url: ?String
    // wire: `mimeType`. Optional. MIME type.
    public let mimeType: ?String
    // wire: `size`. Optional. Byte size.
    public let size: ?UInt64

    public init(fileId!: ?String, name!: ?String, url!: ?String, mimeType!: ?String, size!: ?UInt64) {
        this.fileId = fileId
        this.name = name
        this.url = url
        this.mimeType = mimeType
        this.size = size
    }
}
