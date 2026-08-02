import Foundation

/// GENERATED. Do not edit by hand.
/// Message send acknowledgement notification.
public struct MessageSendAckEvent: Codable, Sendable {
    /// wire: `ack`. Send acknowledgement.
    public let ack: SendMessageResponse

    public init(ack: SendMessageResponse) {
        self.ack = ack
    }
}
