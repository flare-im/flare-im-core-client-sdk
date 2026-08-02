/** GENERATED. Do not edit by hand. */
import type { ConversationTimelineSnapshot } from './conversation_timeline_snapshot';
import type { HomeTimelineSnapshot } from './home_timeline_snapshot';

/** ViewSnapshot */
export type ViewSnapshot =
  | {
      /** wire: `viewType`. */
      viewType: 'timeline';
      /** wire: `data`. */
      data: ConversationTimelineSnapshot;
    }
  | {
      /** wire: `viewType`. */
      viewType: 'conversationList';
      /** wire: `data`. */
      data: HomeTimelineSnapshot;
    };
