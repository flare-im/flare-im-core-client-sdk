// GENERATED. Do not edit by hand.
import 'progress_event_name.dart';

/// Generic sync, upload or download progress notification.
final class ProgressEvent {
  /// wire: `name`. Progress event name.
  final ProgressEventName name;
  /// wire: `operation`. Operation being tracked.
  final String operation;
  /// wire: `current`. Current progress units.
  final int current;
  /// wire: `total`. Total progress units.
  final int total;
  /// wire: `taskId`. Task identifier when available.
  final String? taskId;
  /// wire: `detail`. Human-readable progress detail.
  final String? detail;

  const ProgressEvent({
    required this.name,
    this.operation = '',
    this.current = 0,
    this.total = 0,
    this.taskId,
    this.detail,
  });
}
