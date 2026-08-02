/** GENERATED. Do not edit by hand. */

/** Request for opening an observable conversation timeline view. */
export interface OpenTimelineViewRequest {
  /** wire: `conversationId`. Conversation id to observe. */
  conversationId: string;
  /** wire: `messageLimit`. Maximum messages to include in the initial snapshot. */
  messageLimit: number;
}
