// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/bridge_contract';
import type { ViewsApi } from '../../api/modules/views';
import { CloseViewRequest, CloseViewResponse, LoadOlderTimelineViewRequest, OpenConversationListViewRequest, OpenTimelineViewRequest, ViewLoadOlderResponse, ViewOpenResponse } from '../../model';
import { invokeBool, invokeConnectionState, invokeConversation, invokeConversationTimelineSnapshot, invokeHomeTimelineSnapshot, invokeListConversations, invokeListMessages, invokeMap, invokeMessage, invokeSendAck, invokeVoid, sdkErrorPayloadFromError } from '../codec/nativeInvoke';
import { closeViewRequestToMap, closeViewResponseFromJson, conversationFromJson, listConversationsResponseFromJson, listMessagesResponseFromJson, listOfMaps, loadOlderTimelineViewRequestToMap, messageFromJson, openConversationListViewRequestToMap, openTimelineViewRequestToMap, sendAckFromJson, sendMessageRequestToMap, viewLoadOlderResponseFromJson, viewOpenResponseFromJson } from '../codec/wireCodec';

export class DefaultViewsApi implements ViewsApi {
  constructor(private readonly bridge: NativeBridge) {}

  async openTimeline(request: OpenTimelineViewRequest): Promise<ViewOpenResponse> {
    const raw = await invokeMap(this.bridge, NativeCallMap.viewTimelineOpen, openTimelineViewRequestToMap(request));
    return viewOpenResponseFromJson(raw);
  }

  async loadOlderTimeline(request: LoadOlderTimelineViewRequest): Promise<ViewLoadOlderResponse> {
    const raw = await invokeMap(this.bridge, NativeCallMap.viewTimelineLoadOlder, loadOlderTimelineViewRequestToMap(request));
    return viewLoadOlderResponseFromJson(raw);
  }

  async openConversationList(request: OpenConversationListViewRequest): Promise<ViewOpenResponse> {
    const raw = await invokeMap(this.bridge, NativeCallMap.viewConversationListOpen, openConversationListViewRequestToMap(request));
    return viewOpenResponseFromJson(raw);
  }

  async close(request: CloseViewRequest): Promise<CloseViewResponse> {
    const raw = await invokeMap(this.bridge, NativeCallMap.viewClose, closeViewRequestToMap(request));
    return closeViewResponseFromJson(raw);
  }
}
