// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// Lifecycle listener callbacks.
abstract class LifecycleEventListener {
  const LifecycleEventListener();
  /// SDK initialization has started.
  void onInitializing(LifecycleEvent event) {}
  /// SDK initialization completed successfully.
  void onInitialized(LifecycleEvent event) {}
  /// SDK initialization failed.
  void onInitFailed(LifecycleEvent event) {}
  /// SDK login completed successfully.
  void onLoginSucceeded(LifecycleEvent event) {}
  /// SDK login failed.
  void onLoginFailed(LifecycleEvent event) {}
  /// The current SDK session logged out.
  void onLoggedOut(LifecycleEvent event) {}
  /// The SDK client has been disposed.
  void onDisposed(LifecycleEvent event) {}
}
