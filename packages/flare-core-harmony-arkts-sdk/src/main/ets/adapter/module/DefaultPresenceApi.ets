// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/BridgeContract';
import type { PresenceApi } from '../../api/modules/presence';
import { invokeMap, invokeVoid } from '../codec/NativeInvoke';

export class DefaultPresenceApi implements PresenceApi {
  constructor(private readonly bridge: NativeBridge) {}

  async getUserPresence(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.presenceGet, request);
  }

  async batchGetUserPresence(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.presenceBatchGet, request);
  }

  async subscribeUserPresence(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.presenceSubscribe, request);
  }
}
