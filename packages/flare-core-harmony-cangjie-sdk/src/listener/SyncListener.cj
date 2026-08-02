package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Sync listener callbacks.
public interface SyncEventListener {
    // Server conversation or message sync started.
    func onSyncServerStart(event: SyncEvent): Unit
    // Server conversation or message sync finished.
    func onSyncServerFinish(event: SyncEvent): Unit
    // Server conversation or message sync failed.
    func onSyncServerFailed(event: SyncEvent): Unit
    // Server sync progress changed.
    func onSyncProgress(event: ProgressEvent): Unit
}
