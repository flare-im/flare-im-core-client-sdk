import Foundation

/// GENERATED. Do not edit by hand.
/// Message send failure notification.
public struct MessageSendFailedEvent: Codable, Sendable {
    /// wire: `clientMsgId`. Client message id that failed.
    public let clientMsgId: String
    /// wire: `reason`. Failure reason.
    public let reason: String
    /// wire: `error`. Structured failure details when available.
    public let error: SdkErrorPayload?

    public init(clientMsgId: String = "", reason: String = "", error: SdkErrorPayload? = nil) {
        self.clientMsgId = clientMsgId
        self.reason = reason
        self.error = error
    }
}
