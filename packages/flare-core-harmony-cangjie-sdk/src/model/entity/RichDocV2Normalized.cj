package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Normalized RichDoc v2 payload aligned with core NormalizeOutput.
public class RichDocV2Normalized {
    // wire: `docJson`. Canonical RichDoc v2 JSON document.
    public let docJson: String
    // wire: `contentSchema`. Content schema, normally rich_doc.
    public let contentSchema: String
    // wire: `version`. RichDoc schema version.
    public let version: UInt32
    // wire: `plainText`. Human-readable plain text extracted from the document.
    public let plainText: String
    // wire: `searchText`. Search-indexable text extracted from the document.
    public let searchText: String
    // wire: `renderHints`. Renderer hint object derived by core.
    public let renderHints: String
    // wire: `inputFormat`. Optional. Original source format when known.
    public let inputFormat: ?String
    // wire: `sourcePayload`. Optional. Original source payload snapshot keyed by format.
    public let sourcePayload: ?String

    public init(docJson!: String, contentSchema!: String, version!: UInt32, plainText!: String, searchText!: String, renderHints!: String, inputFormat!: ?String, sourcePayload!: ?String) {
        this.docJson = docJson
        this.contentSchema = contentSchema
        this.version = version
        this.plainText = plainText
        this.searchText = searchText
        this.renderHints = renderHints
        this.inputFormat = inputFormat
        this.sourcePayload = sourcePayload
    }
}
