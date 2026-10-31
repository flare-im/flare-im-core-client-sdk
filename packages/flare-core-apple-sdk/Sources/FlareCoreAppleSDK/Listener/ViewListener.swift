import Foundation

/// GENERATED. Do not edit by hand.
/// View listener callbacks.
public protocol ViewEventListener: AnyObject {
    /// A core observable view changed: the next revision, as a delta or a snapshot.
    func onViewUpdated(_ event: ViewUpdate)
}

public extension ViewEventListener {
    func onViewUpdated(_ event: ViewUpdate) {}
}
