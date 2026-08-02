import Foundation

/// GENERATED. Do not edit by hand.
/// File message payload.
public struct FileContentPayload: Codable, Sendable {
    /// wire: `fileId`. Uploaded file id.
    public let fileId: String?
    /// wire: `name`. Display name.
    public let name: String?
    /// wire: `url`. Download URL.
    public let url: String?
    /// wire: `mimeType`. MIME type.
    public let mimeType: String?
    /// wire: `size`. Byte size.
    public let size: UInt64?

    public init(fileId: String? = nil, name: String? = nil, url: String? = nil, mimeType: String? = nil, size: UInt64? = nil) {
        self.fileId = fileId
        self.name = name
        self.url = url
        self.mimeType = mimeType
        self.size = size
    }
}
