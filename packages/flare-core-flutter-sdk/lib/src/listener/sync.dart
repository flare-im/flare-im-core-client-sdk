// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// Sync listener callbacks.
abstract class SyncEventListener {
  const SyncEventListener();
  /// Server conversation or message sync started.
  void onSyncServerStart(SyncEvent event) {}
  /// Server conversation or message sync finished.
  void onSyncServerFinish(SyncEvent event) {}
  /// Server conversation or message sync failed.
  void onSyncServerFailed(SyncEvent event) {}
  /// Server sync progress changed.
  void onSyncProgress(ProgressEvent event) {}
}
