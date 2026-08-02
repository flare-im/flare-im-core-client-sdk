import Foundation

/// GENERATED. Do not edit by hand.
/// Capability listener callbacks.
public protocol CapabilityEventListener: AnyObject {
    /// A runtime capability or plugin availability changed.
    func onCapabilityChanged(_ event: CapabilityEvent)
}

public extension CapabilityEventListener {
    func onCapabilityChanged(_ event: CapabilityEvent) {}
}
