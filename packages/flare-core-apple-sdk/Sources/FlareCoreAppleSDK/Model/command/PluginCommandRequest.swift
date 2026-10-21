import Foundation

/// GENERATED. Do not edit by hand.
/// 
public struct PluginCommandRequest: Sendable {
    /// wire: `payload`. prepare: slot + command; pending: slot; submit/acknowledge: slot + commandId. Scope is inferred from the active SDK session.
    public let payload: [String: AnySendable]

    public init(payload: [String: AnySendable] = [:]) {
        self.payload = payload
    }
}
