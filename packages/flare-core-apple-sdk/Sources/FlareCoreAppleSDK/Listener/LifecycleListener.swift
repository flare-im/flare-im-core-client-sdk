import Foundation

/// GENERATED. Do not edit by hand.
/// Lifecycle listener callbacks.
public protocol LifecycleEventListener: AnyObject {
    /// SDK initialization has started.
    func onInitializing(_ event: LifecycleEvent)
    /// SDK initialization completed successfully.
    func onInitialized(_ event: LifecycleEvent)
    /// SDK initialization failed.
    func onInitFailed(_ event: LifecycleEvent)
    /// SDK login completed successfully.
    func onLoginSucceeded(_ event: LifecycleEvent)
    /// SDK login failed.
    func onLoginFailed(_ event: LifecycleEvent)
    /// The current SDK session logged out.
    func onLoggedOut(_ event: LifecycleEvent)
    /// The SDK client has been disposed.
    func onDisposed(_ event: LifecycleEvent)
}

public extension LifecycleEventListener {
    func onInitializing(_ event: LifecycleEvent) {}
    func onInitialized(_ event: LifecycleEvent) {}
    func onInitFailed(_ event: LifecycleEvent) {}
    func onLoginSucceeded(_ event: LifecycleEvent) {}
    func onLoginFailed(_ event: LifecycleEvent) {}
    func onLoggedOut(_ event: LifecycleEvent) {}
    func onDisposed(_ event: LifecycleEvent) {}
}
