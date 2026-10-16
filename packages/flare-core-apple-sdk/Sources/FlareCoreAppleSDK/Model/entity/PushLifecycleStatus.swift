import Foundation

/// GENERATED. Do not edit by hand.
/// PushLifecycleStatus
public struct PushLifecycleStatus: Codable, Sendable {
    /// wire: `configuredProviders`. Number of OS providers configured in memory.
    public let configuredProviders: UInt32
    /// wire: `lastError`. Fixed safe error category; no token, URL, bearer or driver detail.
    public let lastError: String?
    /// wire: `pendingRevocations`. Unresolved revoke intents, including writes with an unknown result.
    public let pendingRevocations: UInt32
    /// wire: `registeredProviders`. Providers confirmed for the current session, not vendor delivery.
    public let registeredProviders: UInt32
    /// wire: `state`. disabled, waitingForSession, waitingForToken, pending or registered.
    public let state: String

    public init(configuredProviders: UInt32 = 0, lastError: String? = nil, pendingRevocations: UInt32 = 0, registeredProviders: UInt32 = 0, state: String = "") {
        self.configuredProviders = configuredProviders
        self.lastError = lastError
        self.pendingRevocations = pendingRevocations
        self.registeredProviders = registeredProviders
        self.state = state
    }
}
