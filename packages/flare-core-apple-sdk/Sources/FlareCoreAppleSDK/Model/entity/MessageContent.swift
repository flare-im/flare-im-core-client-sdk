import Foundation

/// GENERATED. Do not edit by hand.
/// Decoded content envelope. Type-specific payload lives in `data` until per-content models are generated.
public struct MessageContent: Sendable {
    /// wire: `contentType`. Content discriminator.
    public let contentType: MessageContentType
    /// wire: `data`. Content payload object.
    public let data: [String: AnySendable]

    public init(contentType: MessageContentType, data: [String: AnySendable] = [:]) {
        self.contentType = contentType
        self.data = data
    }
}
