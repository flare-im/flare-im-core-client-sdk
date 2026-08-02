import Foundation

/// GENERATED. Do not edit by hand.
/// Sync listener callbacks.
public protocol SyncEventListener: AnyObject {
    /// Server conversation or message sync started.
    func onSyncServerStart(_ event: SyncEvent)
    /// Server conversation or message sync finished.
    func onSyncServerFinish(_ event: SyncEvent)
    /// Server conversation or message sync failed.
    func onSyncServerFailed(_ event: SyncEvent)
    /// Server sync progress changed.
    func onSyncProgress(_ event: ProgressEvent)
}

public extension SyncEventListener {
    func onSyncServerStart(_ event: SyncEvent) {}
    func onSyncServerFinish(_ event: SyncEvent) {}
    func onSyncServerFailed(_ event: SyncEvent) {}
    func onSyncProgress(_ event: ProgressEvent) {}
}
