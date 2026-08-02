import { beforeEach, describe, expect, it, vi } from 'vitest';

import { NativeCallMap } from '../../contract/bridge_contract';
import { ffiContractVersion } from '../../contract/sdk_contract';

const tauri = vi.hoisted(() => ({
  invoke: vi.fn(),
  listen: vi.fn(),
}));

vi.mock('@tauri-apps/api/core', () => ({
  invoke: tauri.invoke,
}));

vi.mock('@tauri-apps/api/event', () => ({
  listen: tauri.listen,
}));

describe('Tauri TypeScript SDK adapter', () => {
  beforeEach(() => {
    tauri.invoke.mockReset();
    tauri.listen.mockReset();
  });

  it('uses dedicated lifecycle commands and contract invoke JSON for generated SDK APIs', async () => {
    const { TauriNativeBridge } = await import('./index');
    const bridge = new TauriNativeBridge();

    tauri.invoke.mockImplementation(async (command: string) => {
      if (command === 'sdk_ffi_contract_version') {
        return { version: ffiContractVersion };
      }
      if (command === 'sdk_invoke_json') {
        return true;
      }
      return undefined;
    });

    await bridge.invoke(NativeCallMap.sdkInit, {
      environment: 'development',
      sdkConfig: { transport: 'websocket', wsUrl: 'ws://127.0.0.1:60051/ws' },
    });
    const connected = await bridge.invoke<boolean>(NativeCallMap.sdkIsConnected);

    expect(connected).toBe(true);
    expect(tauri.invoke).toHaveBeenCalledWith('sdk_init', {
      environment: 'development',
      sdkConfig: { transport: 'websocket', wsUrl: 'ws://127.0.0.1:60051/ws' },
    });
    expect(tauri.invoke).toHaveBeenCalledWith('sdk_ffi_contract_version');
    expect(tauri.invoke).toHaveBeenCalledWith('sdk_invoke_json', {
      apiId: 'sdk.is_connected',
      requestJson: '{}',
    });
  });

  it('connects Tauri event channels to DefaultEventsApi when creating the default client', async () => {
    const { FlareCoreSdk } = await import('./index');
    const unlisten = vi.fn();
    let connectedPayload: ((event: { payload: unknown }) => void) | undefined;

    tauri.listen.mockImplementation(async (channel: string, handler: (event: { payload: unknown }) => void) => {
      if (channel === 'im://connected') {
        connectedPayload = handler;
      }
      return unlisten;
    });
    tauri.invoke.mockImplementation(async (command: string) => {
      if (command === 'sdk_ffi_contract_version') {
        return { version: ffiContractVersion };
      }
      return undefined;
    });

    const client = FlareCoreSdk.createClient();
    const received: unknown[] = [];
    client.events.addEventListener({
      onConnectSuccess(event) {
        received.push(event);
      },
    });

    await client.events.subscribeEventsBatch({});
    connectedPayload?.({ payload: { reason: 'ready' } });

    expect(received).toHaveLength(1);
    expect(received[0]).toMatchObject({
      name: 'connected',
      state: 'connected',
      reason: 'ready',
    });
  });
});
