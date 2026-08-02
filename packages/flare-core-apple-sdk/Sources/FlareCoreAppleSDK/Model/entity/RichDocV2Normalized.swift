import Foundation

/// GENERATED. Do not edit by hand.
/// Normalized RichDoc v2 payload aligned with core NormalizeOutput.
public struct RichDocV2Normalized: Sendable {
    /// wire: `docJson`. Canonical RichDoc v2 JSON document.
    public let docJson: String
    /// wire: `contentSchema`. Content schema, normally rich_doc.
    public let contentSchema: String
    /// wire: `version`. RichDoc schema version.
    public let version: UInt32
    /// wire: `plainText`. Human-readable plain text extracted from the document.
    public let plainText: String
    /// wire: `searchText`. Search-indexable text extracted from the document.
    public let searchText: String
    /// wire: `renderHints`. Renderer hint object derived by core.
    public let renderHints: [String: AnySendable]
    /// wire: `inputFormat`. Original source format when known.
    public let inputFormat: String?
    /// wire: `sourcePayload`. Original source payload snapshot keyed by format.
    public let sourcePayload: [String: AnySendable]?

    public init(docJson: String = "", contentSchema: String = "", version: UInt32 = 0, plainText: String = "", searchText: String = "", renderHints: [String: AnySendable] = [:], inputFormat: String? = nil, sourcePayload: [String: AnySendable]? = nil) {
        self.docJson = docJson
        self.contentSchema = contentSchema
        self.version = version
        self.plainText = plainText
        self.searchText = searchText
        self.renderHints = renderHints
        self.inputFormat = inputFormat
        self.sourcePayload = sourcePayload
    }
}
