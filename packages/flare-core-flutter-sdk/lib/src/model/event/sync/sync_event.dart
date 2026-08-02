// GENERATED. Do not edit by hand.
import '../../common/error/sdk_error_payload.dart';
import 'sync_event_name.dart';

/// Sync orchestration notification payload.
final class SyncEvent {
  /// wire: `name`. Sync event name.
  final SyncEventName name;
  /// wire: `runId`. Stable sync run id used to correlate readiness, progress, and completion.
  final String? runId;
  /// wire: `trigger`. Sync trigger.
  final String? trigger;
  /// wire: `scope`. Sync scope.
  final String? scope;
  /// wire: `visibility`. Sync visibility policy.
  final String? visibility;
  /// wire: `reason`. Sync reason for diagnostics and startup wait reports.
  final String? reason;
  /// wire: `phase`. Sync phase.
  final String? phase;
  /// wire: `task`. Sync task name.
  final String? task;
  /// wire: `stage`. Readiness stage for sync.readiness events.
  final String? stage;
  /// wire: `progress`. Progress percentage from 0 to 100.
  final int? progress;
  /// wire: `error`. Failure details for failed sync events.
  final SdkErrorPayload? error;

  const SyncEvent({
    required this.name,
    this.runId,
    this.trigger,
    this.scope,
    this.visibility,
    this.reason,
    this.phase,
    this.task,
    this.stage,
    this.progress,
    this.error,
  });
}
