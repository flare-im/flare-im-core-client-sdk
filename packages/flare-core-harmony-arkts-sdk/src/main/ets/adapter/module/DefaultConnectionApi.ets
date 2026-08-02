// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/BridgeContract';
import type { ConnectionApi } from '../../api/modules/connection';
import type { ConnectionState } from '../../api/client';
import type { NetworkChangeRequest, NetworkChangeResponse } from '../../model';
import { invokeConnectionState, invokeMap, invokeVoid } from '../codec/NativeInvoke';
import { networkChangeRequestToMap, networkChangeResponseFromJson } from '../codec/WireCodec';

export class DefaultConnectionApi implements ConnectionApi {
  constructor(private readonly bridge: NativeBridge) {}

  async getConnectionState(): Promise<ConnectionState> {
    return await invokeConnectionState(this.bridge, NativeCallMap.connectionGetState);
  }

  async disconnect(): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.connectionDisconnect);
  }

  async notifyNetworkChange(request: NetworkChangeRequest): Promise<NetworkChangeResponse> {
    const raw = await invokeMap(this.bridge, NativeCallMap.connectionNotifyNetworkChange, networkChangeRequestToMap(request));
    return networkChangeResponseFromJson(raw);
  }
}
