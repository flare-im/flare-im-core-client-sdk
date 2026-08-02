package flare_core_harmony_cangjie_sdk.model.common.error

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Stable error payload used by lifecycle and async notification failures.
public class SdkErrorPayload {
    // wire: `code`. Stable machine-readable error code.
    public let code: String
    // wire: `message`. Human-readable error message.
    public let message: String
    // wire: `operation`. Optional. Operation that failed.
    public let operation: ?String
    // wire: `retryable`. Optional. Whether retrying may succeed.
    public let retryable: ?Bool
    // wire: `details`. Opaque diagnostic details.
    public let details: String

    public init(code!: String, message!: String, operation!: ?String, retryable!: ?Bool, details!: String) {
        this.code = code
        this.message = message
        this.operation = operation
        this.retryable = retryable
        this.details = details
    }
}
