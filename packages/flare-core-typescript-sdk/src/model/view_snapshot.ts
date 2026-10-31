/** GENERATED. Do not edit by hand. */
import type { HomeTimelineSnapshot } from './home_timeline_snapshot';
import type { TimelineViewSnapshot } from './timeline_view_snapshot';

/** ViewSnapshot */
export type ViewSnapshot =
  | {
      /** wire: `viewType`. */
      viewType: 'timeline';
      /** wire: `data`. */
      data: TimelineViewSnapshot;
    }
  | {
      /** wire: `viewType`. */
      viewType: 'conversationList';
      /** wire: `data`. */
      data: HomeTimelineSnapshot;
    };
