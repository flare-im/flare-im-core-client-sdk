package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Capability listener callbacks.
public interface CapabilityEventListener {
    // A runtime capability or plugin availability changed.
    func onCapabilityChanged(event: CapabilityEvent): Unit
}
