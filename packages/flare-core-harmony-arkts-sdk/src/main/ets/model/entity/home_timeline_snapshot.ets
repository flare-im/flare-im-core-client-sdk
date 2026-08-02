// GENERATED. Do not edit by hand.
import { Conversation } from './conversation';
import { TimelineSyncState } from './timeline_sync_state';

/** HomeTimelineSnapshot */
export interface HomeTimelineSnapshot {
  /** wire: `conversations`.  */
  conversations: Array<Conversation>;
  /** wire: `syncState`.  */
  syncState: TimelineSyncState;
  /** wire: `totalUnread`.  */
  totalUnread: number;
}
