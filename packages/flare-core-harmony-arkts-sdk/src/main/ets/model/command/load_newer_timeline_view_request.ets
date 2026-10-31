// GENERATED. Do not edit by hand.

/** Request for extending a timeline view that is not attached to the latest with newer messages. */
export interface LoadNewerTimelineViewRequest {
  /** wire: `viewId`. Timeline view id returned from openTimeline. */
  viewId: string;
  /** wire: `messageLimit`. Maximum newer messages to load in this page. */
  messageLimit: number;
}
