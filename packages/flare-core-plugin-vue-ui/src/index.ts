import { provide, type Ref } from "vue";
import { provideFlareMessageRenderers, useFlareMessageRenderers } from "@flare-im/vue-ui";
import type { PluginUiSession } from "@flare-im/sdk/plugin-ui";
import { pluginUiSessionKey } from "./context";
import PluginMessage from "./PluginMessage.vue";
/** Call in the chat owner and reset the session when tenant/user changes. */
export function provideCorePluginUi(session: Ref<PluginUiSession | null>): void {
  provide(pluginUiSessionKey, session);
  provideFlareMessageRenderers({ ...useFlareMessageRenderers(), "custom:flare.plugin.message.v1": PluginMessage });
}
