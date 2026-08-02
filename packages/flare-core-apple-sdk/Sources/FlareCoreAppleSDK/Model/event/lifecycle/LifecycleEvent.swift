import Foundation

/// GENERATED. Do not edit by hand.
/// Lifecycle notification. Method return values remain the primary success/failure contract.
public struct LifecycleEvent: Codable, Sendable {
    /// wire: `name`. Lifecycle event name.
    public let name: LifecycleEventName
    /// wire: `operation`. Operation associated with this lifecycle event.
    public let operation: String
    /// wire: `userId`. Current user id when known.
    public let userId: String?
    /// wire: `sessionId`. SDK session id when available.
    public let sessionId: String?
    /// wire: `error`. Failure details for *_failed events.
    public let error: SdkErrorPayload?

    public init(name: LifecycleEventName, operation: String = "", userId: String? = nil, sessionId: String? = nil, error: SdkErrorPayload? = nil) {
        self.name = name
        self.operation = operation
        self.userId = userId
        self.sessionId = sessionId
        self.error = error
    }
}
