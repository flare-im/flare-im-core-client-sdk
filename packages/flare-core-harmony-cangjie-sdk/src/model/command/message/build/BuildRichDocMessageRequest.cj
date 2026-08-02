package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a rich document message.
public class BuildRichDocMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `docJson`. RichDoc JSON document.
    public let docJson: String
    // wire: `contentSchema`. Content schema, normally rich_doc.
    public let contentSchema: String
    // wire: `plainText`. Human-readable plain text.
    public let plainText: String
    // wire: `inputFormat`. Optional. Original source format when known.
    public let inputFormat: ?String
    // wire: `inputFormatVersion`. Optional. Original source format version.
    public let inputFormatVersion: ?Int32
    // wire: `sourcePayload`. Optional. Original source payload snapshot keyed by format.
    public let sourcePayload: ?String
    // wire: `title`. Optional. Rich document title.
    public let title: ?String
    // wire: `searchText`. Optional. Search-indexable text.
    public let searchText: ?String
    // wire: `renderHintsJson`. Optional. Renderer hints JSON.
    public let renderHintsJson: ?String

    public init(conversationId!: String, docJson!: String, contentSchema!: String, plainText!: String, inputFormat!: ?String, inputFormatVersion!: ?Int32, sourcePayload!: ?String, title!: ?String, searchText!: ?String, renderHintsJson!: ?String) {
        this.conversationId = conversationId
        this.docJson = docJson
        this.contentSchema = contentSchema
        this.plainText = plainText
        this.inputFormat = inputFormat
        this.inputFormatVersion = inputFormatVersion
        this.sourcePayload = sourcePayload
        this.title = title
        this.searchText = searchText
        this.renderHintsJson = renderHintsJson
    }
}
