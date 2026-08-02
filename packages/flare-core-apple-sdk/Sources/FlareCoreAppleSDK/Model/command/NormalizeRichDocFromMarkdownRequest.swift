import Foundation

/// GENERATED. Do not edit by hand.
/// Normalize Markdown into RichDoc v2 JSON and derived fields.
public struct NormalizeRichDocFromMarkdownRequest: Codable, Sendable {
    /// wire: `markdown`. Markdown source.
    public let markdown: String

    public init(markdown: String = "") {
        self.markdown = markdown
    }
}
