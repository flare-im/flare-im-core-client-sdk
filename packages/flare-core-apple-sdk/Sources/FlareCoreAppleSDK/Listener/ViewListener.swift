import Foundation

/// GENERATED. Do not edit by hand.
/// View listener callbacks.
public protocol ViewEventListener: AnyObject {
    /// A core observable view snapshot changed.
    func onViewUpdated(_ event: ViewUpdate)
}

public extension ViewEventListener {
    func onViewUpdated(_ event: ViewUpdate) {}
}
