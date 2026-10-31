// GENERATED. Do not edit by hand.
// Module API: `views` — Core observable message/conversation views.
import '../../model/model.dart';

/// Core observable message/conversation views.
abstract interface class ViewsApi {
  /// openTimeline maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.timeline.open`.
  Future<ViewOpenResponse> openTimeline(OpenTimelineViewRequest request);
  /// loadOlderTimeline maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.timeline.load_older`.
  Future<TimelineViewPageResponse> loadOlderTimeline(LoadOlderTimelineViewRequest request);
  /// loadNewerTimeline maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.timeline.load_newer`.
  Future<TimelineViewPageResponse> loadNewerTimeline(LoadNewerTimelineViewRequest request);
  /// jumpToLatestTimeline maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.timeline.jump_to_latest`.
  Future<TimelineViewPageResponse> jumpToLatestTimeline(TimelineViewRequest request);
  /// timelineSnapshot maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.timeline.snapshot`.
  Future<ViewOpenResponse> timelineSnapshot(TimelineViewRequest request);
  /// openConversationList maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.conversation_list.open`.
  Future<ViewOpenResponse> openConversationList(OpenConversationListViewRequest request);
  /// close maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `view.close`.
  Future<CloseViewResponse> close(CloseViewRequest request);
}
