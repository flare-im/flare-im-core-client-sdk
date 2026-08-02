import Foundation

/// GENERATED. Do not edit by hand.
/// Text message body.
public struct TextContentPayload: Codable, Sendable {
    /// wire: `text`. Plain text body.
    public let text: String

    public init(text: String = "") {
        self.text = text
    }
}
