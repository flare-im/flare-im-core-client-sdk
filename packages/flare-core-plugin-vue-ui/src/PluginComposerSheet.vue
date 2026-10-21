<script setup lang="ts">
// 通用插件入口:「+」面板里没有原生处理器的插件项。Kit 底部面板里用 PluginView 画这个
// composer-action 贡献(标题、字段、动作都来自贡献的文档),动作经 Core 带会话 ID 调用;
// 结果的 data.message 是这个插件的合法插件消息时,交给宿主发到当前会话(design §4)。
import { inject, ref, watch } from "vue";
import { FlareBottomSheet, FlarePluginView, useFlareI18n, type FlarePluginViewModel } from "@flare-im/vue-ui";
import type { PluginMessageEnvelope } from "@flare-im/sdk/plugin-ui";
import { pluginUiSessionKey } from "./context";
import { pluginMessageFromResult, type ComposerPluginItem } from "./composerMenu";

const props = defineProps<{
  /** The tapped plugin item; the sheet is open while there is one. */
  item: ComposerPluginItem | null;
  conversationId: string;
  /** Posts a plugin message to the conversation under the given client message id. */
  deliver: (message: PluginMessageEnvelope, clientMsgId: string) => Promise<void>;
}>();
const emit = defineEmits<{ close: [] }>();

const { t } = useFlareI18n();
const session = inject(pluginUiSessionKey, ref(null));
const view = ref<FlarePluginViewModel>({ available: false, title: "", fields: [], actions: [] });
const busy = ref(false), error = ref("");
let generation = 0;

/** The contribution's own document, rendered for this conversation. */
function message(item: ComposerPluginItem): PluginMessageEnvelope {
  return { pluginId: item.pluginId, contributionId: item.contributionId, schemaVersion: 1, summary: item.label,
    payload: { conversationId: props.conversationId } };
}

async function load(): Promise<void> {
  const mine = ++generation, host = session.value, item = props.item;
  busy.value = false; error.value = "";
  view.value = { available: false, title: item?.label ?? "", fields: [], actions: [] };
  if (!host || !item) return;
  const result = await host.present(message(item), undefined, "composer-action");
  if (mine === generation) view.value = result;
}

async function action(id: string): Promise<void> {
  const host = session.value, item = props.item, mine = generation;
  if (!host || !item || busy.value || !view.value.available) return;
  busy.value = true; error.value = "";
  try {
    const outcome = await host.invokeAction(message(item), id, { conversationId: props.conversationId, userGesture: true });
    if (mine !== generation) return;
    if (outcome.kind === "operation") {
      if (outcome.response.success === false) { error.value = t("pluginRuntime.rejected"); return; }
      const posted = pluginMessageFromResult(outcome.response.data, item.pluginId);
      if (posted) {
        // One id per action result: resending after a lost acknowledgement does not post twice.
        const requestId = typeof outcome.response.requestId === "string" && outcome.response.requestId ? outcome.response.requestId : crypto.randomUUID();
        await props.deliver(posted, `plugin_${requestId}`);
      }
    }
    if (mine === generation) emit("close");
  } catch {
    if (mine === generation) error.value = t("pluginRuntime.unavailable");
  } finally {
    if (mine === generation) busy.value = false;
  }
}

watch(() => [props.item, props.conversationId, session.value], () => { void load(); }, { immediate: true });
</script>

<template>
  <FlareBottomSheet :open="Boolean(item)" :title="view.title || item?.label || ''" :dismissible="!busy" @close="emit('close')">
    <FlarePluginView :view="view" :busy="busy" :error="error" @action="action" />
  </FlareBottomSheet>
</template>
