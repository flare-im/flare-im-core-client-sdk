// GENERATED. Do not edit by hand.

/// Response of loadOlderTimeline, loadNewerTimeline and jumpToLatestTimeline. The rows themselves arrive only through view.updated.
final class TimelineViewPageResponse {
  /// wire: `viewId`. Timeline view id.
  final String viewId;
  /// wire: `loadedCount`. Rows this call added to the window.
  final int loadedCount;
  /// wire: `revision`. Revision that contains this page (0 when the view was already closed).
  final int revision;

  const TimelineViewPageResponse({
    this.viewId = '',
    this.loadedCount = 0,
    this.revision = 0,
  });
}
