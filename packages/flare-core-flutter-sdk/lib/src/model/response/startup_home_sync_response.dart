// GENERATED. Do not edit by hand.
import '../entity/home_timeline_snapshot.dart';

/// First usable home snapshot plus diagnostics about the startup sync path.
final class StartupHomeSyncResponse {
  /// wire: `backgroundConvergenceStarted`. 
  final bool backgroundConvergenceStarted;
  /// wire: `coldSyncPerformed`. 
  final bool coldSyncPerformed;
  /// wire: `degradedReason`. 
  final String? degradedReason;
  /// wire: `servedFromLocal`. 
  final bool servedFromLocal;
  /// wire: `snapshot`. 
  final HomeTimelineSnapshot snapshot;

  const StartupHomeSyncResponse({
    this.backgroundConvergenceStarted = false,
    this.coldSyncPerformed = false,
    this.degradedReason,
    this.servedFromLocal = false,
    required this.snapshot,
  });
}
