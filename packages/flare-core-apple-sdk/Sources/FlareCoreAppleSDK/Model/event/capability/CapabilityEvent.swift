import Foundation

/// GENERATED. Do not edit by hand.
/// Capability/plugin notification payload.
public struct CapabilityEvent: Codable, Sendable {
    /// wire: `name`. Capability event name.
    public let name: CapabilityEventName
    /// wire: `capability`. Capability key.
    public let capability: String?
    /// wire: `reason`. Unavailable/change reason.
    public let reason: String?

    public init(name: CapabilityEventName, capability: String? = nil, reason: String? = nil) {
        self.name = name
        self.capability = capability
        self.reason = reason
    }
}
