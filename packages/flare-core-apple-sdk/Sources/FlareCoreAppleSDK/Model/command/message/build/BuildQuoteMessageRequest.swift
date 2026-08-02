import Foundation

/// GENERATED. Do not edit by hand.
/// Build a quote/reply message.
public struct BuildQuoteMessageRequest: Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `quotedMessageId`. Quoted message id.
    public let quotedMessageId: String
    /// wire: `text`. Reply text.
    public let text: String
    /// wire: `quotedSenderId`. Quoted sender id.
    public let quotedSenderId: String?
    /// wire: `quotedTextPreview`. Quoted preview text.
    public let quotedTextPreview: String?
    /// wire: `quotedContent`. Quoted message content element.
    public let quotedContent: MessageContent

    public init(conversationId: String = "", quotedMessageId: String = "", text: String = "", quotedSenderId: String? = nil, quotedTextPreview: String? = nil, quotedContent: MessageContent) {
        self.conversationId = conversationId
        self.quotedMessageId = quotedMessageId
        self.text = text
        self.quotedSenderId = quotedSenderId
        self.quotedTextPreview = quotedTextPreview
        self.quotedContent = quotedContent
    }
}
