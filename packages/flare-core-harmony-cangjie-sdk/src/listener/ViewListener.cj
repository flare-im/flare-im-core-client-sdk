package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// View listener callbacks.
public interface ViewEventListener {
    // A core observable view changed: the next revision, as a delta or a snapshot.
    func onViewUpdated(event: ViewUpdate): Unit
}
