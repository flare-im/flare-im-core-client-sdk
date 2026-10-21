import Foundation

/// GENERATED. Do not edit by hand.
/// Send a fully built message.
public struct SendMessageRequest: Sendable {
    /// wire: `message`. Message to send.
    public let message: Message
    /// wire: `expectedUserId`. Optional active-user precondition; cannot override the authenticated sender.
    public let expectedUserId: String?

    public init(message: Message, expectedUserId: String? = nil) {
        self.message = message
        self.expectedUserId = expectedUserId
    }
}
