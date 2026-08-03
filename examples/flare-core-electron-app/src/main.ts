import { createApp } from "vue";
import App from "./App.vue";
import { router } from "./router";
import {
  configureProductionStorageBackend,
  sdkMediaProxyFields,
} from "@flare-im/vue-ui/app";
import { configureMediaProxy } from "@flare-im/vue-ui/utils";
import { configureElectronDesktopNotifications } from "./desktopNotifications";
import { createSqliteOpfsStorageHost } from "./storage/sqliteOpfsStorageHost";
import "@flare-im/vue-ui/app/style.css";

// Electron renderer uses the @flare-im/sdk web client directly (WASM core →
// WebSocket); WASM has no QUIC, so the transport stays WebSocket on every build.
// Storage differs by build target:
//   - packaged desktop app (Electron shell present) → SQLite (wa-sqlite + OPFS, app-owned)
//   - web build (dev:web / preview, no Electron preload) → IndexedDB
const isDesktopShell =
  (window as { flareDesktop?: { runtime?: string } }).flareDesktop?.runtime === "electron";
if (isDesktopShell) {
  configureProductionStorageBackend("sqlite", createSqliteOpfsStorageHost);
} else {
  configureProductionStorageBackend("indexeddb");
}

configureMediaProxy(sdkMediaProxyFields());
configureElectronDesktopNotifications();

const app = createApp(App);
app.use(router);
app.mount("#app");
