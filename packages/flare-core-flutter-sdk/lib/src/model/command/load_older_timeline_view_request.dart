// GENERATED. Do not edit by hand.

/// Request for extending an open timeline view with older messages.
final class LoadOlderTimelineViewRequest {
  /// wire: `viewId`. Timeline view id returned from openTimeline.
  final String viewId;
  /// wire: `messageLimit`. Maximum older messages to load in this page.
  final int messageLimit;

  const LoadOlderTimelineViewRequest({
    this.viewId = '',
    this.messageLimit = 0,
  });
}
