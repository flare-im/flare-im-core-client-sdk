import Foundation

/// GENERATED. Do not edit by hand.
/// Validate editor-produced RichDoc v2 JSON and derive searchable/render fields.
public struct NormalizeRichDocFromDocJsonRequest: Codable, Sendable {
    /// wire: `docJson`. RichDoc v2 document JSON.
    public let docJson: String

    public init(docJson: String = "") {
        self.docJson = docJson
    }
}
