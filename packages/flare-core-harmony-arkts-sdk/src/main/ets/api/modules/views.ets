// GENERATED. Do not edit by hand.
import { CapabilityEvent, ConnectionEvent, ConversationEvent, LifecycleEvent, MessageMutationEvent, MessageReceivedBatchEvent, MessageReceivedEvent, MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent, ReactionChangedEvent, ReadReceiptEvent, SyncEvent, TypingAggregateEvent, TypingEvent, ViewUpdate } from '../../model';

/** Core observable message/conversation views. */
export interface ViewsApi {
  openTimeline(request: OpenTimelineViewRequest): Promise<ViewOpenResponse>;
  loadOlderTimeline(request: LoadOlderTimelineViewRequest): Promise<ViewLoadOlderResponse>;
  openConversationList(request: OpenConversationListViewRequest): Promise<ViewOpenResponse>;
  close(request: CloseViewRequest): Promise<CloseViewResponse>;
}
