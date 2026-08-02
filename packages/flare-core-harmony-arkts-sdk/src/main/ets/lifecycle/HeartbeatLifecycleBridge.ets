import type { FlareImClient } from '../api/client';
import { HeartbeatAppState } from '../model';

/** GENERATED. Do not edit by hand. */
export class HeartbeatLifecycleBridge {
  constructor(private readonly client: FlareImClient) {}

  async onShow(): Promise<void> {
    await this.setForeground();
  }

  async onHide(): Promise<void> {
    await this.setBackground();
  }

  async setForeground(): Promise<void> {
    await this.client.setHeartbeatAppState({ appState: HeartbeatAppState.Foreground });
  }

  async setBackground(): Promise<void> {
    await this.client.setHeartbeatAppState({ appState: HeartbeatAppState.Background });
  }
}
