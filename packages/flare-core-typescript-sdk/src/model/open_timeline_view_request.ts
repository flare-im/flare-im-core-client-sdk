/** GENERATED. Do not edit by hand. */
import type { TimelineAnchor } from './timeline_anchor';

/** Request for opening an observable conversation timeline view. */
export interface OpenTimelineViewRequest {
  /** wire: `conversationId`. Conversation id to observe. */
  conversationId: string;
  /** wire: `messageLimit`. Page size: rows in the initial window and in each older or newer page when a paging request does not give its own (core default 40, at most 100). */
  messageLimit: number;
  /** wire: `anchor`. Open around this message instead of at the latest messages; the window holds half a page on each side of it. */
  anchor?: TimelineAnchor;
}
