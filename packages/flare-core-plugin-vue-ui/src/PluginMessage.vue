<script setup lang="ts">
import { inject, onBeforeUnmount, ref, watch } from "vue";
import { FlarePluginView, useFlareI18n, type FlarePluginViewModel } from "@flare-im/vue-ui";
import { pluginUiConversationKey, pluginUiSessionKey } from "./context";
const { t } = useFlareI18n();
const props = defineProps<{
  content: Record<string, unknown>;
  /** The timeline's id for the message; Core keeps the card state on it. */
  messageId?: string;
  /** The timeline's conversation, when the kit hands it to renderers. */
  conversationId?: string;
  /** Message attributes; `pluginStateVersion` moves when Core stores new card state. */
  messageExtra?: Record<string, unknown>;
}>();
const session = inject(pluginUiSessionKey, ref(null));
const hostConversation = inject(pluginUiConversationKey, () => undefined);
const view = ref<FlarePluginViewModel>({ available: false, title: "", fields: [], actions: [] });
const busy = ref(false), error = ref("");
let generation = 0;
/** Core merges the stored card state before it resolves the view; nothing is merged here. */
async function refresh(reset = true) {
  const mine = ++generation, host = session.value;
  const summary = typeof props.content.description === "string" ? props.content.description : "";
  if (reset) view.value = { available: false, title: summary, fields: [], actions: [] };
  const message = host?.envelope(props.content);
  if (!host || !message) return;
  const result = await host.present(message, props.messageId);
  if (mine === generation && host === session.value) view.value = result;
}
async function action(id: string) {
  const host = session.value, mine = generation, message = host?.envelope(props.content);
  if (!host || !message || busy.value || !view.value.available) return;
  busy.value = true; error.value = "";
  try {
    const outcome = await host.invokeAction(message, id, { messageId: props.messageId, conversationId: props.conversationId || hostConversation(), userGesture: true });
    if (mine !== generation) return;
    if (outcome.kind === "operation" && outcome.response.success === false) error.value = t("pluginRuntime.rejected");
    // Core has stored the state the plugin returned on this message: show it without waiting for the event.
    else void refresh(false);
  } catch { if (mine === generation) error.value = t("pluginRuntime.unavailable"); }
  finally { if (mine === generation) busy.value = false; }
}
// A stored message's card changes only with its stored state; a reload hands the row a fresh content object.
watch(() => [props.messageId ?? props.content, props.messageExtra?.pluginStateVersion, session.value], () => { busy.value = false; void refresh(); }, { immediate: true });
// Expiry and revocation remove historical actions even while a timeline stays open.
const timer = setInterval(() => { if (!busy.value) void refresh(false); }, 30000);
onBeforeUnmount(() => { generation++; clearInterval(timer); });
</script>
<template><FlarePluginView :view="view" :busy="busy" :error="error" @action="action" /></template>
