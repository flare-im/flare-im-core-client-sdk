// GENERATED. Do not edit by hand.
import { Conversation } from './conversation';
import { ViewDeltaOp } from './view_delta_op';

/** Typed delta emitted by core observable views. */
export interface ViewDelta {
  /** wire: `viewType`. Delta tag: timeline or conversationList. */
  viewType: string;
  /** wire: `ops`. Ordered delta operations. */
  ops: Array<ViewDeltaOp>;
  /** wire: `conversation`. Latest timeline conversation header for timeline deltas. */
  conversation?: Conversation;
  /** wire: `hasMore`. Latest timeline pagination state for timeline deltas. */
  hasMore?: boolean;
  /** wire: `totalUnread`. Latest total unread value for conversation list deltas. */
  totalUnread?: number;
  /** wire: `syncState`. Latest sync state for conversation list deltas. */
  syncState?: string;
}
