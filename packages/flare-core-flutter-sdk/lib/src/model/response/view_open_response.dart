// GENERATED. Do not edit by hand.
import '../entity/view_snapshot.dart';

/// Response returned when opening an observable view.
final class ViewOpenResponse {
  /// wire: `viewId`. Opened view id.
  final String viewId;
  /// wire: `snapshot`. Initial snapshot for this view.
  final ViewSnapshot snapshot;

  const ViewOpenResponse({
    this.viewId = '',
    required this.snapshot,
  });
}
