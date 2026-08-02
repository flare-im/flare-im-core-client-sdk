/** GENERATED. Do not edit by hand. */

/** Request for extending an open timeline view with older messages. */
export interface LoadOlderTimelineViewRequest {
  /** wire: `viewId`. Timeline view id returned from openTimeline. */
  viewId: string;
  /** wire: `messageLimit`. Maximum older messages to load in this page. */
  messageLimit: number;
}
