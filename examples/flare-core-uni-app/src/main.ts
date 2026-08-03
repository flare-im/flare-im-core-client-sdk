import { createSSRApp } from "vue";
import { FlareCoreSdk } from "@flare-im/sdk/uni-app";
import { configureMediaProxy } from "@flare-im/vue-ui/utils";

import App from "../App.vue";
import { router } from "./router";
import {
  configureAppTransportSelector,
  sdkMediaProxyFields,
  configureProductionAppClientFactory,
} from "@flare-im/vue-ui/app";
import { installUniFlarePlatformAdapters } from "./platform/uniFlarePlatform";
import "@flare-im/vue-ui/app/style.css";

configureMediaProxy(sdkMediaProxyFields());
if (isUniNativeTransportRuntime()) {
  configureAppTransportSelector({
    enabled: true,
    runtimeStatus: "uni-native",
    tlsCaCertPath: import.meta.env.VITE_FLARE_TLS_CA_CERT_PATH,
  });
}
configureProductionAppClientFactory(() => FlareCoreSdk.createClient());
installUniFlarePlatformAdapters();

export function createApp() {
  const app = createSSRApp(App);
  app.use(router);
  return { app };
}

function isUniNativeTransportRuntime(): boolean {
  const platform = String(import.meta.env.UNI_PLATFORM ?? "").trim().toLowerCase();
  return Boolean(platform) && platform !== "h5" && platform !== "web";
}
