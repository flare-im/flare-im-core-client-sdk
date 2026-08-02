package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Platform network-change notification used to trigger active reconnect.
public class NetworkChangeRequest {
    // wire: `available`. Optional. Whether a network route is currently available. Omitted means available.
    public let available: ?Bool
    // wire: `interface`. Optional. Standardized platform network interface hint.
    public let interface: ?NetworkInterfaceKind
    // wire: `expensive`. Optional. Whether the active route is considered expensive by the platform.
    public let expensive: ?Bool
    // wire: `metered`. Optional. Whether the active route is metered.
    public let metered: ?Bool
    // wire: `reason`. Optional. Optional platform reason string for diagnostics.
    public let reason: ?String

    public init(available!: ?Bool, interface!: ?NetworkInterfaceKind, expensive!: ?Bool, metered!: ?Bool, reason!: ?String) {
        this.available = available
        this.interface = interface
        this.expensive = expensive
        this.metered = metered
        this.reason = reason
    }
}
