import Foundation

/// GENERATED. Do not edit by hand.
/// Message page response.
public struct ListMessagesResponse: Sendable {
    /// wire: `messages`. Returned messages.
    public let messages: [Message]

    public init(messages: [Message] = []) {
        self.messages = messages
    }
}
