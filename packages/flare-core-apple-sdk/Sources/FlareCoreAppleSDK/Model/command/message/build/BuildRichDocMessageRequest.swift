import Foundation

/// GENERATED. Do not edit by hand.
/// Build a rich document message.
public struct BuildRichDocMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `docJson`. RichDoc JSON document.
    public let docJson: String
    /// wire: `contentSchema`. Content schema, normally rich_doc.
    public let contentSchema: String
    /// wire: `plainText`. Human-readable plain text.
    public let plainText: String
    /// wire: `inputFormat`. Original source format when known.
    public let inputFormat: String?
    /// wire: `inputFormatVersion`. Original source format version.
    public let inputFormatVersion: Int32?
    /// wire: `sourcePayload`. Original source payload snapshot keyed by format.
    public let sourcePayload: [String: String]?
    /// wire: `title`. Rich document title.
    public let title: String?
    /// wire: `searchText`. Search-indexable text.
    public let searchText: String?
    /// wire: `renderHintsJson`. Renderer hints JSON.
    public let renderHintsJson: String?

    public init(conversationId: String = "", docJson: String = "", contentSchema: String = "", plainText: String = "", inputFormat: String? = nil, inputFormatVersion: Int32? = nil, sourcePayload: [String: String]? = nil, title: String? = nil, searchText: String? = nil, renderHintsJson: String? = nil) {
        self.conversationId = conversationId
        self.docJson = docJson
        self.contentSchema = contentSchema
        self.plainText = plainText
        self.inputFormat = inputFormat
        self.inputFormatVersion = inputFormatVersion
        self.sourcePayload = sourcePayload
        self.title = title
        self.searchText = searchText
        self.renderHintsJson = renderHintsJson
    }
}
