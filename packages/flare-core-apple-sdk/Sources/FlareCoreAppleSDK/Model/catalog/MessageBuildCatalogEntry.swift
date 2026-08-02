import Foundation

/// GENERATED. Do not edit by hand.
/// One supported quick-build operation exposed on MessageBuilderApi.
public struct MessageBuildCatalogEntry: Codable, Sendable {
    /// wire: `op`. Build dispatch op.
    public let op: MessageBuildOp
    /// wire: `method`. Facade method name, e.g. buildText.
    public let method: String
    /// wire: `requestType`. Typed request model name.
    public let requestType: String
    /// wire: `contentType`. Decoded content discriminator.
    public let contentType: MessageContentType
    /// wire: `messageType`. Core message type integer.
    public let messageType: Int32
    /// wire: `summary`. Human-readable summary for UI/docs.
    public let summary: String
    /// wire: `stability`. stable | beta | experimental
    public let stability: String

    public init(op: MessageBuildOp, method: String = "", requestType: String = "", contentType: MessageContentType, messageType: Int32 = 0, summary: String = "", stability: String = "") {
        self.op = op
        self.method = method
        self.requestType = requestType
        self.contentType = contentType
        self.messageType = messageType
        self.summary = summary
        self.stability = stability
    }
}
