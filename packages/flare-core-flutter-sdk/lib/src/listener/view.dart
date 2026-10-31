// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// View listener callbacks.
abstract class ViewEventListener {
  const ViewEventListener();
  /// A core observable view changed: the next revision, as a delta or a snapshot.
  void onViewUpdated(ViewUpdate event) {}
}
