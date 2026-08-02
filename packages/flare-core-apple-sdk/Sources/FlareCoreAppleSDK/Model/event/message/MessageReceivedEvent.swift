import Foundation

/// GENERATED. Do not edit by hand.
/// Single message received notification.
public struct MessageReceivedEvent: Sendable {
    /// wire: `message`. Received message.
    public let message: Message

    public init(message: Message) {
        self.message = message
    }
}
