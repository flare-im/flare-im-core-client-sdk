import type { InjectionKey, Ref } from "vue";
import type { FlarePluginMember, FlarePluginResolveUser } from "@flare-im/vue-ui";
import type { PluginUiSession } from "@flare-im/sdk/plugin-ui";
export const pluginUiSessionKey: InjectionKey<Ref<PluginUiSession | null>> = Symbol("core-plugin-ui-session");
/** The conversation the timeline shows; card actions are dispatched bound to it. */
export const pluginUiConversationKey: InjectionKey<() => string | undefined> = Symbol("core-plugin-ui-conversation");

/** Who the people in plugin cards are, as the host knows them. Both members are optional. */
export interface CorePluginDirectory {
  /** Name and avatar of a user id (people and entries blocks); sync or async. Unknown ids draw the kit's fallback. */
  resolveUser?: FlarePluginResolveUser;
  /**
   * Members of the open conversation, offered by `members` form inputs. Read when a card or the
   * "+" entry renders, so return a stable array (a computed's value), not a new one per call.
   */
  members?: () => FlarePluginMember[] | undefined;
}
export const pluginUiDirectoryKey: InjectionKey<CorePluginDirectory> = Symbol("core-plugin-ui-directory");
