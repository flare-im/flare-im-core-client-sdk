// GENERATED. Do not edit by hand.
import 'view_delta.dart';
import 'view_snapshot.dart';

/// Observable view update event payload (view.updated). Every update a view publishes carries the next revision; a host that sees a revision that is not its applied revision plus 1 drops it when it is not newer, otherwise replaces its window with timelineSnapshot.
final class ViewUpdate {
  /// wire: `viewId`. Updated view id.
  final String viewId;
  /// wire: `revision`. Revision this update brings the view to.
  final int revision;
  /// wire: `kind`. Update kind: snapshot or delta.
  final String kind;
  /// wire: `snapshot`. Whole view when kind is snapshot.
  final ViewSnapshot? snapshot;
  /// wire: `delta`. View delta when kind is delta.
  final ViewDelta? delta;

  const ViewUpdate({
    this.viewId = '',
    this.revision = 0,
    this.kind = '',
    this.snapshot,
    this.delta,
  });
}
