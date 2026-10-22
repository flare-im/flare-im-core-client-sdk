import { provide, type Ref } from "vue";
import { provideFlareMessageRenderers, useFlareMessageRenderers } from "@flare-im/vue-ui";
import type { PluginUiSession } from "@flare-im/sdk/plugin-ui";
import { pluginUiConversationKey, pluginUiDirectoryKey, pluginUiSessionKey, type CorePluginDirectory } from "./context";
import PluginMessage from "./PluginMessage.vue";
/** The generic card, for hosts that render some plugins with their own components and the rest with this. */
export { PluginMessage as CorePluginMessage };
/** The generic "+" entry for a plugin item the host has no page for. */
export { default as PluginComposerSheet } from "./PluginComposerSheet.vue";
export * from "./composerMenu";
export type { CorePluginDirectory } from "./context";
/** Call in the chat owner and reset the session when tenant/user changes. `conversationId` is the
 * conversation the timeline shows; card actions are dispatched bound to it. `resolveUser` and
 * `members` are the directory cards and the "+" entry use (see `provideCorePluginDirectory`). */
export function provideCorePluginUi(session: Ref<PluginUiSession | null>,
  options: { conversationId?: () => string | undefined } & CorePluginDirectory = {}): void {
  provide(pluginUiSessionKey, session);
  if (options.conversationId) provide(pluginUiConversationKey, options.conversationId);
  if (options.resolveUser || options.members) provideCorePluginDirectory({ resolveUser: options.resolveUser, members: options.members });
  provideFlareMessageRenderers({ ...useFlareMessageRenderers(), "custom:flare.plugin.message.v1": PluginMessage });
}
/**
 * Who the people in plugin cards are: names and avatars for user ids (people, entries) and the open
 * conversation's members (members inputs of card forms and the "+" entry). Call in the chat owner,
 * next to `provideCorePluginUi` or a plugin's own provider that calls it; without it cards draw the
 * kit's fallback names and members inputs offer nobody.
 */
export function provideCorePluginDirectory(directory: CorePluginDirectory): void {
  provide(pluginUiDirectoryKey, directory);
}
