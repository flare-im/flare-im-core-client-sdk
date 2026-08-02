package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Lifecycle listener callbacks.
public interface LifecycleEventListener {
    // SDK initialization has started.
    func onInitializing(event: LifecycleEvent): Unit
    // SDK initialization completed successfully.
    func onInitialized(event: LifecycleEvent): Unit
    // SDK initialization failed.
    func onInitFailed(event: LifecycleEvent): Unit
    // SDK login completed successfully.
    func onLoginSucceeded(event: LifecycleEvent): Unit
    // SDK login failed.
    func onLoginFailed(event: LifecycleEvent): Unit
    // The current SDK session logged out.
    func onLoggedOut(event: LifecycleEvent): Unit
    // The SDK client has been disposed.
    func onDisposed(event: LifecycleEvent): Unit
}
