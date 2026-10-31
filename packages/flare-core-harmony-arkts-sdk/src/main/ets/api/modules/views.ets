// GENERATED. Do not edit by hand.
import { ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, PluginCatalogChangedEvent, PluginRealtimeEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Core observable message/conversation views. */
export interface ViewsApi {
  openTimeline(request: OpenTimelineViewRequest): Promise<ViewOpenResponse>;
  loadOlderTimeline(request: LoadOlderTimelineViewRequest): Promise<TimelineViewPageResponse>;
  loadNewerTimeline(request: LoadNewerTimelineViewRequest): Promise<TimelineViewPageResponse>;
  jumpToLatestTimeline(request: TimelineViewRequest): Promise<TimelineViewPageResponse>;
  timelineSnapshot(request: TimelineViewRequest): Promise<ViewOpenResponse>;
  openConversationList(request: OpenConversationListViewRequest): Promise<ViewOpenResponse>;
  close(request: CloseViewRequest): Promise<CloseViewResponse>;
}
