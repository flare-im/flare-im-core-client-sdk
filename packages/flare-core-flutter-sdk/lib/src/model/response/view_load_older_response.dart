// GENERATED. Do not edit by hand.
import '../entity/view_update.dart';

/// Response returned after extending an observable timeline view.
final class ViewLoadOlderResponse {
  /// wire: `viewId`. Updated timeline view id.
  final String viewId;
  /// wire: `loadedCount`. Number of older messages inserted into the view window.
  final int loadedCount;
  /// wire: `hasMore`. Whether older messages may still be available.
  final bool hasMore;
  /// wire: `update`. Delta or snapshot that applies this page to the view.
  final ViewUpdate? update;

  const ViewLoadOlderResponse({
    this.viewId = '',
    this.loadedCount = 0,
    this.hasMore = false,
    this.update,
  });
}
