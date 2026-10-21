import type { InjectionKey, Ref } from "vue";
import type { PluginUiSession } from "@flare-im/sdk/plugin-ui";
export const pluginUiSessionKey: InjectionKey<Ref<PluginUiSession | null>> = Symbol("core-plugin-ui-session");
