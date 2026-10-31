import Foundation

/// GENERATED. Do not edit by hand.
/// Stable error payload used by lifecycle and async notification failures.
public struct SdkErrorPayload: Codable, Sendable {
    /// wire: `code`. Stable machine-readable error code.
    public let code: String
    /// wire: `machineReason`. Server's typed reason (ErrorDetail.reason, e.g. a PreSend rejection code); empty or absent for local failures.
    public let machineReason: String?
    /// wire: `message`. Human-readable error message.
    public let message: String
    /// wire: `operation`. Operation that failed.
    public let operation: String?
    /// wire: `retryable`. Whether retrying may succeed.
    public let retryable: Bool?
    /// wire: `details`. Opaque diagnostic details.
    public let details: [String: String]

    public init(code: String = "", machineReason: String? = nil, message: String = "", operation: String? = nil, retryable: Bool? = nil, details: [String: String] = [:]) {
        self.code = code
        self.machineReason = machineReason
        self.message = message
        self.operation = operation
        self.retryable = retryable
        self.details = details
    }
}
