package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// PushLifecycleStatus
public class PushLifecycleStatus {
    // wire: `configuredProviders`. Number of OS providers configured in memory.
    public let configuredProviders: UInt32
    // wire: `lastError`. Optional. Fixed safe error category; no token, URL, bearer or driver detail.
    public let lastError: ?String
    // wire: `pendingRevocations`. Unresolved revoke intents, including writes with an unknown result.
    public let pendingRevocations: UInt32
    // wire: `registeredProviders`. Providers confirmed for the current session, not vendor delivery.
    public let registeredProviders: UInt32
    // wire: `state`. disabled, waitingForSession, waitingForToken, pending or registered.
    public let state: String

    public init(configuredProviders!: UInt32, lastError!: ?String, pendingRevocations!: UInt32, registeredProviders!: UInt32, state!: String) {
        this.configuredProviders = configuredProviders
        this.lastError = lastError
        this.pendingRevocations = pendingRevocations
        this.registeredProviders = registeredProviders
        this.state = state
    }
}
