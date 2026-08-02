// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/bridge_contract';
import type { CapabilitiesApi } from '../../api/modules/capabilities';
import { invokeBool, invokeConnectionState, invokeConversation, invokeConversationTimelineSnapshot, invokeHomeTimelineSnapshot, invokeListConversations, invokeListMessages, invokeMap, invokeMessage, invokeSendAck, invokeVoid, sdkErrorPayloadFromError } from '../codec/nativeInvoke';
import { conversationFromJson, listConversationsResponseFromJson, listMessagesResponseFromJson, listOfMaps, messageFromJson, sendAckFromJson, sendMessageRequestToMap } from '../codec/wireCodec';

export class DefaultCapabilitiesApi implements CapabilitiesApi {
  constructor(private readonly bridge: NativeBridge) {}

  async listCapabilities(request: Record<string, unknown>): Promise<Record<string, unknown>> {
    return await invokeMap(this.bridge, NativeCallMap.capabilityList, request);
  }

  async listUserCapabilities(request: Record<string, unknown>): Promise<Record<string, unknown>> {
    return await invokeMap(this.bridge, NativeCallMap.capabilityListUser, request);
  }

  async dispatchCapability(request: Record<string, unknown>): Promise<Record<string, unknown>> {
    return await invokeMap(this.bridge, NativeCallMap.capabilityDispatch, request);
  }

  async grantCapability(request: Record<string, unknown>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.capabilityGrant, request);
  }

  async revokeCapability(request: Record<string, unknown>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.capabilityRevoke, request);
  }

  async sendCallSignal(request: Record<string, unknown>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.capabilitySendCallSignal, request);
  }
}
