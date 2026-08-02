// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/BridgeContract';
import type { CapabilitiesApi } from '../../api/modules/capabilities';
import { invokeMap, invokeVoid } from '../codec/NativeInvoke';

export class DefaultCapabilitiesApi implements CapabilitiesApi {
  constructor(private readonly bridge: NativeBridge) {}

  async listCapabilities(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.capabilityList, request);
  }

  async listUserCapabilities(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.capabilityListUser, request);
  }

  async dispatchCapability(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.capabilityDispatch, request);
  }

  async grantCapability(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.capabilityGrant, request);
  }

  async revokeCapability(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.capabilityRevoke, request);
  }

  async sendCallSignal(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.capabilitySendCallSignal, request);
  }
}
