// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/bridge_contract';
import type { ConnectionApi } from '../../api/modules/connection';
import type { ConnectionState } from '../../contract/sdk_contract';
import { NetworkChangeRequest, NetworkChangeResponse } from '../../model';
import { invokeBool, invokeConnectionState, invokeConversation, invokeConversationTimelineSnapshot, invokeHomeTimelineSnapshot, invokeListConversations, invokeListMessages, invokeMap, invokeMessage, invokeSendAck, invokeVoid, sdkErrorPayloadFromError } from '../codec/nativeInvoke';
import { conversationFromJson, listConversationsResponseFromJson, listMessagesResponseFromJson, listOfMaps, messageFromJson, networkChangeRequestToMap, sendAckFromJson, sendMessageRequestToMap } from '../codec/wireCodec';

export class DefaultConnectionApi implements ConnectionApi {
  constructor(private readonly bridge: NativeBridge) {}

  async getConnectionState(): Promise<ConnectionState> {
    return await invokeConnectionState(this.bridge, NativeCallMap.connectionGetState);
  }

  async disconnect(): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.connectionDisconnect);
  }

  async notifyNetworkChange(request: NetworkChangeRequest): Promise<NetworkChangeResponse> {
    return await invokeMap(this.bridge, NativeCallMap.connectionNotifyNetworkChange, networkChangeRequestToMap(request)) as unknown as NetworkChangeResponse;
  }
}
