import { provide, type Ref } from "vue";
import { provideFlareMessageRenderers, useFlareMessageRenderers } from "@flare-im/vue-ui";
import type { PluginUiSession } from "@flare-im/sdk/plugin-ui";
import { pluginUiConversationKey, pluginUiSessionKey } from "./context";
import PluginMessage from "./PluginMessage.vue";
/** The generic card, for hosts that render some plugins with their own components and the rest with this. */
export { PluginMessage as CorePluginMessage };
/** The generic "+" entry for a plugin item the host has no page for. */
export { default as PluginComposerSheet } from "./PluginComposerSheet.vue";
export * from "./composerMenu";
/** Call in the chat owner and reset the session when tenant/user changes. `conversationId` is the
 * conversation the timeline shows; card actions are dispatched bound to it. */
export function provideCorePluginUi(session: Ref<PluginUiSession | null>, options: { conversationId?: () => string | undefined } = {}): void {
  provide(pluginUiSessionKey, session);
  if (options.conversationId) provide(pluginUiConversationKey, options.conversationId);
  provideFlareMessageRenderers({ ...useFlareMessageRenderers(), "custom:flare.plugin.message.v1": PluginMessage });
}
