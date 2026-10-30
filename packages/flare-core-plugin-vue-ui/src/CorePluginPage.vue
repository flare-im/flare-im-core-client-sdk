<script setup lang="ts">
/**
 * A plugin page (a wallet, a ledger) hosted on the core SDK: the kit's FlarePluginPage over `pluginPage`. The 我 entries
 * of plugins and the page targets of card actions open here.
 *
 * The page document, its source, paging, rows and actions are declared by the plugin and resolved by Core; this only
 * holds the filters and the page stack and forwards requests: the first page and a refresh (`refresh` with the shown
 * view), a next page (`page` with the cursor and the shown view, Core merges them), a filter (the first page with the
 * new values), a page action (`invokePageAction` with the view's `data` and the row's `row`, no message). A page target
 * an action opens is pushed with its own plugin; back pops it, and on the root page emits `back`.
 */
import { computed, ref, shallowRef, watch } from "vue";
import {
  FlarePluginPage,
  useFlareI18n,
  type FlarePluginFormError,
  type FlarePluginPageAppearance,
  type FlarePluginPageRef,
  type FlarePluginPageActionPayload,
  type FlarePluginResolveUser,
} from "@flare-im/vue-ui";
import {
  pluginManifestLocale,
  type PluginPagePresentation,
  type PluginPlatform,
  type PluginUiPort,
  type PluginUiSession,
} from "@flare-im/sdk/plugin-ui";
import type { CorePluginErrorText } from "./context";
import { corePluginPageSession, type CorePluginPageEntry } from "./pluginPage";

const props = defineProps<{
  /** The page the stack starts from. */
  root: CorePluginPageEntry;
  pageAppearance?: (page: FlarePluginPageRef) => FlarePluginPageAppearance;
  /** The core SDK's plugin port (the social SDK's `plugins`); nothing loads while it is null. */
  port: PluginUiPort | null;
  platform: PluginPlatform;
  /** Names and avatars of the people a page shows. */
  resolveUser?: FlarePluginResolveUser;
  /** The viewer's user id (the me tag in entries). */
  viewerId?: string;
  /** The host's copy for a failed plugin call (`sdk.plugin.*`), as given to `provideCorePluginUi`. */
  errorText?: CorePluginErrorText;
  /** The host's line for a page that failed to load for any other reason. */
  loadFailedText: string;
}>();
const emit = defineEmits<{ back: [] }>();

const { t, locale } = useFlareI18n();
/** The pages opened from the root, the root first. Each keeps its own filters. */
const stack = ref<Array<CorePluginPageEntry & { filters: Record<string, unknown> }>>([{ ...props.root, filters: {} }]);
const top = computed(() => stack.value[stack.value.length - 1]);
const session = shallowRef<PluginUiSession | null>(null);
watch([() => props.port, () => props.viewerId], ([port]) => {
  session.value?.reset();
  session.value = port
    ? corePluginPageSession(port, props.platform, () => pluginManifestLocale(locale.value), () => top.value,
      (entry) => { stack.value = [...stack.value, { ...entry, filters: {} }]; })
    : null;
}, { immediate: true });

const view = shallowRef<PluginPagePresentation>();
const loading = ref(false);
const refreshing = ref(false);
const loadingMore = ref(false);
const error = ref("");
const busyActionId = ref<string>();
const actionError = ref("");
const formErrors = shallowRef<FlarePluginFormError[]>([]);
const settleToken = ref(0);
let generation = 0;

const failure = (cause: unknown) => props.errorText?.(cause) ?? props.loadFailedText;

/**
 * The top entry's page with its filters. `open`: the first page, nothing shown meanwhile. `filter`: the first page with
 * new filters, the shown page kept until it arrives. `refresh`: the shown page read again from the first page, as many
 * pages as it had loaded (the core's refresh), kept until it arrives.
 */
async function load(mode: "open" | "filter" | "refresh" = "open"): Promise<void> {
  const mine = ++generation;
  const active = session.value;
  const entry = top.value;
  error.value = "";
  if (!active || !entry) return;
  const shown = mode === "open" ? undefined : view.value;
  if (shown) refreshing.value = true;
  else {
    loading.value = true;
    view.value = undefined;
  }
  try {
    const next = await active.page(entry.pluginId, entry.page, {
      ...(entry.args ? { args: entry.args } : {}),
      ...(Object.keys(entry.filters).length ? { filters: entry.filters } : {}),
      ...(mode === "refresh" && shown ? { refresh: shown } : {}),
    });
    if (mine === generation) view.value = next;
  } catch (cause) {
    console.warn("[plugin-page] load failed", cause instanceof Error ? cause.message : String(cause));
    if (mine === generation) error.value = failure(cause);
  } finally {
    if (mine === generation) {
      loading.value = false;
      refreshing.value = false;
    }
  }
}
// Getters only: the stack array among the sources would make the watcher fire on every stack write (a filter, say).
watch([() => session.value, () => top.value.pluginId, () => top.value.page, () => JSON.stringify(top.value.args), () => stack.value.length], () => {
  busyActionId.value = undefined;
  actionError.value = "";
  formErrors.value = [];
  void load();
}, { immediate: true });

async function loadMore(cursor: string): Promise<void> {
  const active = session.value;
  const entry = top.value;
  const previous = view.value;
  if (!active || !previous || loadingMore.value) return;
  const mine = ++generation;
  loadingMore.value = true;
  actionError.value = "";
  try {
    const merged = await active.page(entry.pluginId, entry.page, {
      ...(entry.args ? { args: entry.args } : {}),
      filters: entry.filters,
      page: { cursor, previous },
    });
    if (mine === generation) view.value = merged;
  } catch (cause) {
    // What is shown stays; the failure is said where the page's actions say theirs, and the next tap asks again.
    if (mine === generation) actionError.value = failure(cause);
  } finally {
    if (mine === generation) loadingMore.value = false;
  }
}

/** A filter tab: the page's first page again with the new values (a filter the page drops comes back unset). */
function filter(values: Record<string, unknown>): void {
  stack.value = [...stack.value.slice(0, -1), { ...top.value, filters: values }];
  void load("filter");
}

async function action(actionId: string, payload: FlarePluginPageActionPayload): Promise<void> {
  const active = session.value;
  const entry = top.value;
  if (!active || busyActionId.value) return;
  const depth = stack.value.length;
  busyActionId.value = actionId;
  actionError.value = "";
  formErrors.value = [];
  let changed = false;
  try {
    const outcome = await active.invokePageAction(entry.pluginId, entry.page, actionId, {
      userGesture: true,
      ...(payload.data ? { data: payload.data } : {}),
      ...(payload.row ? { row: payload.row as { key: string; input: Record<string, unknown> } } : {}),
      ...(payload.formValues ? { formValues: payload.formValues } : {}),
      ...(payload.selection ? { selection: payload.selection } : {}),
    });
    if (outcome.kind === "formErrors") formErrors.value = outcome.errors;
    else if (outcome.kind === "operation") {
      changed = true;
      if (outcome.response.success === false) actionError.value = t("pluginRuntime.rejected");
    }
  } catch (cause) {
    actionError.value = props.errorText?.(cause) ?? t("pluginRuntime.unavailable");
  } finally {
    settleToken.value++;
    busyActionId.value = undefined;
  }
  // An operation may have moved what the page shows; a page target has opened the next page instead.
  if (changed && stack.value.length === depth) void load("refresh");
}

function back(): void {
  if (stack.value.length > 1) stack.value = stack.value.slice(0, -1);
  else emit("back");
}
</script>

<template>
  <FlarePluginPage
    class="core-plugin-page"
    :page="{ pluginId: top.pluginId, page: top.page }"
    :title="top.title"
    :appearance="pageAppearance?.({ pluginId: top.pluginId, page: top.page })"
    :view="view"
    :filters="top.filters"
    :loading="loading"
    :error="error || undefined"
    :refreshing="refreshing"
    :loading-more="loadingMore"
    back
    :resolve-user="resolveUser"
    :viewer-id="viewerId"
    :busy-action-id="busyActionId"
    :action-error="actionError || undefined"
    :form-errors="formErrors"
    :settle-token="settleToken"
    @back="back"
    @refresh="load('refresh')"
    @retry="load()"
    @load-more="loadMore"
    @filter="filter"
    @action="action"
  />
</template>

<style scoped>
/* The page fills the destination it is pushed into. */
.core-plugin-page {
  height: 100%;
  min-height: 0;
}
</style>
