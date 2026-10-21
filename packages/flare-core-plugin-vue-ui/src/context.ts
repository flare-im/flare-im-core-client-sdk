import type { InjectionKey, Ref } from "vue";
import type { PluginUiSession } from "@flare-im/sdk/plugin-ui";
export const pluginUiSessionKey: InjectionKey<Ref<PluginUiSession | null>> = Symbol("core-plugin-ui-session");
/** The conversation the timeline shows; card actions are dispatched bound to it. */
export const pluginUiConversationKey: InjectionKey<() => string | undefined> = Symbol("core-plugin-ui-conversation");
