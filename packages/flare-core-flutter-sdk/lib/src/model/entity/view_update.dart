// GENERATED. Do not edit by hand.
import 'view_delta.dart';
import 'view_snapshot.dart';

/// Observable view update event payload.
final class ViewUpdate {
  /// wire: `viewId`. Updated view id.
  final String viewId;
  /// wire: `kind`. Update kind: snapshot or delta.
  final String kind;
  /// wire: `snapshot`. Latest snapshot for this view when kind is snapshot.
  final ViewSnapshot? snapshot;
  /// wire: `delta`. View delta when kind is delta.
  final ViewDelta? delta;

  const ViewUpdate({
    this.viewId = '',
    this.kind = '',
    this.snapshot,
    this.delta,
  });
}
