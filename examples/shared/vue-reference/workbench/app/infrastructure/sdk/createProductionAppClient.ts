import type { FlareImClient } from "@flare-im/sdk/api";

export type ProductionAppClientFactory = () => FlareImClient;
let clientFactory: ProductionAppClientFactory | null = null;

export function configureProductionAppClientFactory(factory: ProductionAppClientFactory | null): void {
  clientFactory = factory;
}

export function createProductionAppClient(): FlareImClient {
  if (!clientFactory) throw new Error("Configure the platform SDK client before mounting the reference app");
  return clientFactory();
}
