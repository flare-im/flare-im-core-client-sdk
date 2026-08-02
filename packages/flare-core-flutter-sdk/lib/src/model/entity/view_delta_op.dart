// GENERATED. Do not edit by hand.

/// One operation in an observable view delta.
final class ViewDeltaOp {
  /// wire: `op`. Delta operation: insert, update, remove, or move.
  final String op;
  /// wire: `key`. Stable item key owned by core.
  final String key;
  /// wire: `index`. Target index after applying the operation.
  final int index;
  /// wire: `fromIndex`. Previous index for move operations.
  final int? fromIndex;
  /// wire: `item`. Inserted or updated item payload.
  final Map<String, Object?>? item;

  const ViewDeltaOp({
    this.op = '',
    this.key = '',
    this.index = 0,
    this.fromIndex,
    this.item,
  });
}
