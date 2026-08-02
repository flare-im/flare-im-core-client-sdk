/** GENERATED. Do not edit by hand. */
import type { Conversation } from './conversation';
import type { TimelineSyncState } from './timeline_sync_state';

/** HomeTimelineSnapshot */
export interface HomeTimelineSnapshot {
  /** wire: `conversations`.  */
  conversations: Conversation[];
  /** wire: `syncState`.  */
  syncState: TimelineSyncState;
  /** wire: `totalUnread`.  */
  totalUnread: number;
}
