// GENERATED. Do not edit by hand.

/// Request for extending a timeline view that is not attached to the latest with newer messages.
final class LoadNewerTimelineViewRequest {
  /// wire: `viewId`. Timeline view id returned from openTimeline.
  final String viewId;
  /// wire: `messageLimit`. Maximum newer messages to load in this page.
  final int messageLimit;

  const LoadNewerTimelineViewRequest({
    this.viewId = '',
    this.messageLimit = 0,
  });
}
