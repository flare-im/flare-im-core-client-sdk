import Foundation

/// GENERATED. Do not edit by hand.
/// Normalize an HTML fragment into RichDoc v2 JSON and derived fields.
public struct NormalizeRichDocFromHtmlRequest: Codable, Sendable {
    /// wire: `html`. HTML fragment source.
    public let html: String

    public init(html: String = "") {
        self.html = html
    }
}
