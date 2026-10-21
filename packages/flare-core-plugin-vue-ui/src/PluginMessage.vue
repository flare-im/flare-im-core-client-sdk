<script setup lang="ts">
import { inject, onBeforeUnmount, ref, watch } from "vue";
import { FlarePluginView, useFlareI18n, type FlarePluginViewModel } from "@flare-im/vue-ui";
import { pluginUiSessionKey } from "./context";
const { t } = useFlareI18n();
const props = defineProps<{ content: Record<string, unknown> }>();
const session = inject(pluginUiSessionKey, ref(null));
const view = ref<FlarePluginViewModel>({ available: false, title: "", fields: [], actions: [] });
const busy = ref(false), error = ref("");
let generation = 0;
async function refresh() {
  const mine = ++generation, host = session.value;
  const summary = typeof props.content.description === "string" ? props.content.description : "";
  view.value = { available: false, title: summary, fields: [], actions: [] };
  const message = host?.envelope(props.content);
  if (!host || !message) return;
  const result = await host.resolve(message);
  if (mine === generation && host === session.value) view.value = result;
}
async function action(id: string) {
  const host = session.value, mine = generation, message = host?.envelope(props.content);
  if (!host || !message || busy.value || !view.value.available) return;
  busy.value = true; error.value = "";
  try {
    const result = await host.invoke(message, id, true) as { success?: boolean; data?: unknown } | undefined;
    if (mine !== generation) return;
    if (result?.success === false) error.value = t("pluginRuntime.rejected");
    else if (result?.data && typeof result.data === "object") {
      const data = result.data as Record<string, unknown>;
      const presentation = await host.resolve({ ...message, payload: { ...message.payload, ...data } });
      if (mine === generation) view.value = presentation;
    }
  } catch { if (mine === generation) error.value = t("pluginRuntime.unavailable"); }
  finally { if (mine === generation) busy.value = false; }
}
watch(() => [props.content, session.value], () => { busy.value = false; void refresh(); }, { immediate: true });
// Expiry and revocation remove historical actions even while a timeline stays open.
const timer = setInterval(() => { if (!busy.value) void refresh(); }, 30000);
onBeforeUnmount(() => { generation++; clearInterval(timer); });
</script>
<template><FlarePluginView :view="view" :busy="busy" :error="error" @action="action" /></template>
