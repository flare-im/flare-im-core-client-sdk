import Foundation

/// GENERATED. Do not edit by hand.
/// Platform network-change notification used to trigger active reconnect.
public struct NetworkChangeRequest: Codable, Sendable {
    /// wire: `available`. Whether a network route is currently available. Omitted means available.
    public let available: Bool?
    /// wire: `interface`. Standardized platform network interface hint.
    public let interface: NetworkInterfaceKind?
    /// wire: `expensive`. Whether the active route is considered expensive by the platform.
    public let expensive: Bool?
    /// wire: `metered`. Whether the active route is metered.
    public let metered: Bool?
    /// wire: `reason`. Optional platform reason string for diagnostics.
    public let reason: String?

    public init(available: Bool? = nil, interface: NetworkInterfaceKind? = nil, expensive: Bool? = nil, metered: Bool? = nil, reason: String? = nil) {
        self.available = available
        self.interface = interface
        self.expensive = expensive
        self.metered = metered
        self.reason = reason
    }
}
