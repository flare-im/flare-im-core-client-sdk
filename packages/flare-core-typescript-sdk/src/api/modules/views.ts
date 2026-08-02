/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `views` — Core observable message/conversation views.
 */
import type { CloseViewRequest, CloseViewResponse, LoadOlderTimelineViewRequest, OpenConversationListViewRequest, OpenTimelineViewRequest, ViewLoadOlderResponse, ViewOpenResponse } from '../../model';

/** Core observable message/conversation views. */
export interface ViewsApi {
  /** openTimeline maps to `flare_sdk_invoke_json`. Operation: `view.timeline.open`. */
  openTimeline(request: OpenTimelineViewRequest): Promise<ViewOpenResponse>;
  /** loadOlderTimeline maps to `flare_sdk_invoke_json`. Operation: `view.timeline.load_older`. */
  loadOlderTimeline(request: LoadOlderTimelineViewRequest): Promise<ViewLoadOlderResponse>;
  /** openConversationList maps to `flare_sdk_invoke_json`. Operation: `view.conversation_list.open`. */
  openConversationList(request: OpenConversationListViewRequest): Promise<ViewOpenResponse>;
  /** close maps to `flare_sdk_invoke_json`. Operation: `view.close`. */
  close(request: CloseViewRequest): Promise<CloseViewResponse>;
}
