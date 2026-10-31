/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `views` — Core observable message/conversation views.
 */
import type { CloseViewRequest, CloseViewResponse, LoadNewerTimelineViewRequest, LoadOlderTimelineViewRequest, OpenConversationListViewRequest, OpenTimelineViewRequest, TimelineViewPageResponse, TimelineViewRequest, ViewOpenResponse } from '../../model';

/** Core observable message/conversation views. */
export interface ViewsApi {
  /** openTimeline maps to `flare_sdk_invoke_json`. Operation: `view.timeline.open`. */
  openTimeline(request: OpenTimelineViewRequest): Promise<ViewOpenResponse>;
  /** loadOlderTimeline maps to `flare_sdk_invoke_json`. Operation: `view.timeline.load_older`. */
  loadOlderTimeline(request: LoadOlderTimelineViewRequest): Promise<TimelineViewPageResponse>;
  /** loadNewerTimeline maps to `flare_sdk_invoke_json`. Operation: `view.timeline.load_newer`. */
  loadNewerTimeline(request: LoadNewerTimelineViewRequest): Promise<TimelineViewPageResponse>;
  /** jumpToLatestTimeline maps to `flare_sdk_invoke_json`. Operation: `view.timeline.jump_to_latest`. */
  jumpToLatestTimeline(request: TimelineViewRequest): Promise<TimelineViewPageResponse>;
  /** timelineSnapshot maps to `flare_sdk_invoke_json`. Operation: `view.timeline.snapshot`. */
  timelineSnapshot(request: TimelineViewRequest): Promise<ViewOpenResponse>;
  /** openConversationList maps to `flare_sdk_invoke_json`. Operation: `view.conversation_list.open`. */
  openConversationList(request: OpenConversationListViewRequest): Promise<ViewOpenResponse>;
  /** close maps to `flare_sdk_invoke_json`. Operation: `view.close`. */
  close(request: CloseViewRequest): Promise<CloseViewResponse>;
}
