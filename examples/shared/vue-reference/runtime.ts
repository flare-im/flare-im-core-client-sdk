import type { FlareImClient } from "@flare-im/sdk/api";
import type { FlarePlatformOptions } from "@flare-im/vue-ui/composables";

/** Platform factories supply public SDK clients; reference composition is shared. */
export interface ReferenceRuntime {
  id: "web" | "tauri";
  label: string;
  createClient: () => FlareImClient;
  /** The host's platform contract (kind / adapter / capability overrides) handed to FlareUiProvider. */
  platform?: FlarePlatformOptions;
}
