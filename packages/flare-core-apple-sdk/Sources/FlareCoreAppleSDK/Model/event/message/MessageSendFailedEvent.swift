import Foundation

/// GENERATED. Do not edit by hand.
/// Message send failure notification.
public struct MessageSendFailedEvent: Codable, Sendable {
    /// wire: `clientMsgId`. Client message id that failed.
    public let clientMsgId: String
    /// wire: `reason`. Failure reason text for people; use error.code and error.machineReason to act on it.
    public let reason: String
    /// wire: `error`. Structured failure: code, machineReason (ErrorDetail.reason when the server rejected), message, operation, retryable, details.
    public let error: SdkErrorPayload?

    public init(clientMsgId: String = "", reason: String = "", error: SdkErrorPayload? = nil) {
        self.clientMsgId = clientMsgId
        self.reason = reason
        self.error = error
    }
}
