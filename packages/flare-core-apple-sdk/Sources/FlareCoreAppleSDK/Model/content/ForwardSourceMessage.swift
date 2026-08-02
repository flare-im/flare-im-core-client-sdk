import Foundation

/// GENERATED. Do not edit by hand.
/// One source message inside a forward bundle.
public struct ForwardSourceMessage: Codable, Sendable {
    /// wire: `sourceMessageId`. Original message id.
    public let sourceMessageId: String
    /// wire: `sourceConversationId`. Original conversation id.
    public let sourceConversationId: String?
    /// wire: `sourceSenderId`. Original sender id.
    public let sourceSenderId: String?
    /// wire: `plainText`. Preview text.
    public let plainText: String?

    public init(sourceMessageId: String = "", sourceConversationId: String? = nil, sourceSenderId: String? = nil, plainText: String? = nil) {
        self.sourceMessageId = sourceMessageId
        self.sourceConversationId = sourceConversationId
        self.sourceSenderId = sourceSenderId
        self.plainText = plainText
    }
}
