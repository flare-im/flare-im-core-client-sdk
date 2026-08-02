// GENERATED. Do not edit by hand.

/// Tagged snapshot emitted by core observable views.
final class ViewSnapshot {
  /// wire: `viewType`. Snapshot tag: timeline or conversationList.
  final String viewType;
  /// wire: `data`. Snapshot payload selected by viewType.
  final Object? data;

  const ViewSnapshot({
    this.viewType = '',
    this.data,
  });
}
