import Foundation

/// GENERATED. Do not edit by hand.
/// Send a fully built message.
public struct SendMessageRequest: Sendable {
    /// wire: `message`. Message to send.
    public let message: Message

    public init(message: Message) {
        self.message = message
    }
}
