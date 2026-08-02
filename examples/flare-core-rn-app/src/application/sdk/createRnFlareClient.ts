import type { FlareImClient } from 'flare-core-typescript-sdk/api';
import { FlareCoreSdk } from 'flare-core-typescript-sdk/react-native';

export function createRnFlareClient(): FlareImClient {
  return FlareCoreSdk.createClient();
}
