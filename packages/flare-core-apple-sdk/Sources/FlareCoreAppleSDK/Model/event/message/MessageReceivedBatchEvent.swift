import Foundation

/// GENERATED. Do not edit by hand.
/// Batch message received notification.
public struct MessageReceivedBatchEvent: Sendable {
    /// wire: `messages`. Received messages.
    public let messages: [Message]

    public init(messages: [Message] = []) {
        self.messages = messages
    }
}
