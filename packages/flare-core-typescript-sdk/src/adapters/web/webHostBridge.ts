import type { NativeBridge } from '../../contract/bridge_contract';

export type WebHostBridge = NativeBridge;

export function wrapWebHostBridge(bridge: WebHostBridge): NativeBridge {
  return bridge;
}
