// GENERATED. Do not edit by hand.
import '../entity/view_snapshot.dart';

/// Response returned when opening an observable view and by timelineSnapshot.
final class ViewOpenResponse {
  /// wire: `viewId`. View id.
  final String viewId;
  /// wire: `revision`. Revision of this snapshot; every later view.updated event for the view carries the next revision.
  final int revision;
  /// wire: `snapshot`. Snapshot of the view at that revision.
  final ViewSnapshot snapshot;

  const ViewOpenResponse({
    this.viewId = '',
    this.revision = 0,
    required this.snapshot,
  });
}
