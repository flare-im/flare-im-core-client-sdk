<script setup lang="ts">
// A plugin card in the timeline: Core resolves the view over the card's stored state layers, the
// kit draws it (PluginView v2), and actions go back to Core with the viewer's selection or form
// values. The host's part of the kit contract lives here: `busyActionId` while an action is in
// flight, `error` cleared when the next one starts, Core's `formErrors` handed back to the form,
// `settleToken` moved once per finished action after its outcome is set, and "see all" in the kit
// detail sheet over `session.detail` with its own action state and its pages.
import { computed, inject, onBeforeUnmount, ref, shallowReactive, shallowRef, watch } from "vue";
import {
  FlarePluginDetailSheet, FlarePluginView, useFlareI18n,
  type FlarePluginActionPayload, type FlarePluginFormError, type FlarePluginMember, type FlarePluginResolveUser,
  type FlarePluginViewModel,
} from "@flare-im/vue-ui";
import type { PluginDetailPresentation } from "@flare-im/sdk/plugin-ui";
import { pluginUiConversationKey, pluginUiDirectoryKey, pluginUiSessionKey } from "./context";

// The kit hands renderers more than these (isSelf, listeners); a card with a detail sheet has two roots.
defineOptions({ inheritAttrs: false });
const { t } = useFlareI18n();
const props = defineProps<{
  content: Record<string, unknown>;
  /** The timeline's id for the message; Core keeps the card state on it. */
  messageId?: string;
  /** The timeline's conversation, when the kit hands it to renderers. */
  conversationId?: string;
  /**
   * Message attributes. `pluginStateVersion` (the viewer's layer) and `pluginSharedStateVersion`
   * (the layer Core publishes for the card's entity) move when Core stores new card state.
   */
  messageExtra?: Record<string, unknown>;
  /** Overrides the provided directory's resolver for this card. */
  resolveUser?: FlarePluginResolveUser;
  /** Overrides the provided directory's conversation members for this card. */
  members?: FlarePluginMember[];
}>();
const session = inject(pluginUiSessionKey, ref(null));
const hostConversation = inject(pluginUiConversationKey, () => undefined);
const directory = inject(pluginUiDirectoryKey, {});
const resolver = computed(() => props.resolveUser ?? directory.resolveUser);
const members = computed(() => props.members ?? directory.members?.() ?? []);
const conversation = () => props.conversationId || hostConversation();

const placeholder = (): FlarePluginViewModel => ({
  available: false, title: typeof props.content.description === "string" ? props.content.description : "", fields: [], actions: [],
});
const view = shallowRef<FlarePluginViewModel>(placeholder());
let viewGeneration = 0;
/**
 * Core merges the stored card state before it resolves the view; nothing is merged here. A view
 * equal to the one shown is not assigned again: a new view resets the kit's optimistic choice and
 * an unsent multiple-choice draft, and periodic or duplicate refreshes must not.
 */
async function refresh(reset: boolean): Promise<void> {
  const mine = ++viewGeneration, host = session.value;
  if (reset) view.value = placeholder();
  const message = host?.envelope(props.content);
  if (!host || !message) return;
  const result = await host.present(message, props.messageId);
  if (mine !== viewGeneration || host !== session.value) return;
  if (!reset && JSON.stringify(result) === JSON.stringify(view.value)) return;
  view.value = result;
}

// ── actions ──────────────────────────────────────────────────────────────
/**
 * Where an action runs from: the card, or the detail sheet over it. Each has its own spinner, failure, form
 * errors and settle signal, so a failure in the detail stays in the sheet and never lands on the card below.
 */
interface ActionSurface {
  busyActionId: string | undefined;
  error: string;
  formErrors: FlarePluginFormError[];
  /** Moved once per finished action, after that action's error and formErrors are set (kit settleToken). */
  settleToken: number;
}
const actionSurface = (): ActionSurface => shallowReactive({ busyActionId: undefined, error: "", formErrors: [], settleToken: 0 });
const onCard = actionSurface();
const inDetail = actionSurface();
/** One per card identity: an action started for another message or session settles nothing here. */
let actionScope = 0;
/** One action per card at a time, from either surface. */
async function runAction(surface: ActionSurface, id: string, payload: FlarePluginActionPayload): Promise<void> {
  const host = session.value, scope = actionScope, message = host?.envelope(props.content);
  if (!host || !message || onCard.busyActionId || inDetail.busyActionId || !view.value.available) return;
  surface.busyActionId = id; surface.error = ""; surface.formErrors = [];
  let changed = false;
  try {
    const outcome = await host.invokeAction(message, id, {
      messageId: props.messageId, conversationId: conversation(), userGesture: true,
      ...(payload.formValues ? { formValues: payload.formValues } : {}), ...(payload.selection ? { selection: payload.selection } : {}),
    });
    if (scope !== actionScope) return;
    if (outcome.kind === "formErrors") surface.formErrors = outcome.errors;
    else if (outcome.kind === "operation" && outcome.response.success === false) surface.error = t("pluginRuntime.rejected");
    // Core has stored the state the plugin returned on this message: show it without waiting for the event.
    else changed = true;
  } catch {
    if (scope === actionScope) surface.error = t("pluginRuntime.unavailable");
  } finally {
    if (scope === actionScope) {
      // The outcome is set: settle it (closes a submitted form, keeps or reverts the optimistic choice).
      surface.settleToken++;
      surface.busyActionId = undefined;
    }
  }
  if (changed) {
    void refresh(false);
    if (detailOpen.value) void loadDetail(true);
  }
}
const cardAction = (id: string, payload: FlarePluginActionPayload = {}) => runAction(onCard, id, payload);
const detailAction = (id: string, payload: FlarePluginActionPayload = {}) => runAction(inDetail, id, payload);

// ── "see all" ────────────────────────────────────────────────────────────
const detailUsed = ref(false), detailOpen = ref(false), detailLoading = ref(false), detailError = ref("");
/** The next page is on its way (kit loadingMore). */
const detailLoadingMore = ref(false);
/** The sheet as Core returned it; handed back unchanged as `previous` for the next page. */
const detailView = shallowRef<PluginDetailPresentation>();
let detailGeneration = 0;
const detailRequest = () => ({ messageId: props.messageId, conversationId: conversation(), userGesture: true });
/**
 * Core runs the contribution's detail operation over the merged card data. `quiet` keeps the shown view while it
 * reloads and asks Core to refresh it: the first page again and as many more as the sheet had loaded, so a state
 * change never folds the pages the viewer opened.
 */
async function loadDetail(quiet = false): Promise<void> {
  const mine = ++detailGeneration, host = session.value, message = host?.envelope(props.content), shown = detailView.value;
  if (!quiet || !shown) detailLoading.value = true;
  // A reload starts again from the first page: a page still on its way is dropped.
  detailError.value = ""; detailLoadingMore.value = false;
  try {
    if (!host || !message) throw new Error("Plugin detail unavailable");
    const result = await host.detail(message, { ...detailRequest(), ...(quiet && shown ? { refresh: shown } : {}) });
    if (mine === detailGeneration) detailView.value = result;
  } catch {
    if (mine === detailGeneration && !(quiet && detailView.value)) detailError.value = t("pluginRuntime.unavailable");
  } finally {
    if (mine === detailGeneration) detailLoading.value = false;
  }
}
/**
 * The page after `cursor` (the shown sheet's nextCursor): the same request plus the cursor and the shown sheet, which
 * Core returns with the page appended. The result replaces the sheet whole; nothing is merged here. A failure keeps
 * what is shown and says so where the detail's actions do.
 */
async function loadMoreDetail(cursor: string): Promise<void> {
  const host = session.value, message = host?.envelope(props.content), previous = detailView.value;
  if (!host || !message || !previous || detailLoadingMore.value) return;
  const mine = ++detailGeneration;
  detailLoadingMore.value = true; inDetail.error = "";
  try {
    const merged = await host.detail(message, { ...detailRequest(), page: { cursor, previous } });
    if (mine === detailGeneration) detailView.value = merged;
  } catch {
    if (mine === detailGeneration) inDetail.error = t("pluginRuntime.unavailable");
  } finally {
    if (mine === detailGeneration) detailLoadingMore.value = false;
  }
}
function openDetail(): void {
  if (!view.value.available || !view.value.detail) return;
  detailUsed.value = true; detailOpen.value = true; detailView.value = undefined;
  inDetail.error = ""; inDetail.formErrors = [];
  void loadDetail();
}
function closeDetail(): void {
  detailGeneration++;
  detailOpen.value = false; detailLoading.value = false; detailError.value = ""; detailLoadingMore.value = false;
}

// ── lifecycle ────────────────────────────────────────────────────────────
// Another message or session: drop what belonged to the previous card. A stored message's card
// changes only with its stored state; a reload hands the row a fresh content object.
watch([() => props.messageId ?? props.content, () => session.value], () => {
  actionScope++;
  for (const surface of [onCard, inDetail]) { surface.busyActionId = undefined; surface.error = ""; surface.formErrors = []; }
  closeDetail();
  void refresh(true);
}, { immediate: true });
// New card state on either layer (the viewer's own, or the shared one others change in real time).
watch([() => props.messageExtra?.pluginStateVersion, () => props.messageExtra?.pluginSharedStateVersion], () => {
  void refresh(false);
  if (detailOpen.value && detailView.value) void loadDetail(true);
});
// Expiry and revocation remove historical actions even while a timeline stays open.
const timer = setInterval(() => { if (!onCard.busyActionId && !inDetail.busyActionId) void refresh(false); }, 30000);
onBeforeUnmount(() => { viewGeneration++; actionScope++; detailGeneration++; clearInterval(timer); });
</script>
<template>
  <FlarePluginView
    :view="view"
    :busy-action-id="onCard.busyActionId"
    :error="onCard.error || undefined"
    :form-errors="onCard.formErrors"
    :settle-token="onCard.settleToken"
    :resolve-user="resolver"
    :members="members"
    @action="cardAction"
    @open-detail="openDetail"
  />
  <FlarePluginDetailSheet
    v-if="detailUsed"
    :open="detailOpen"
    :title="view.title"
    :view="detailView"
    :loading="detailLoading"
    :error="detailError || undefined"
    :resolve-user="resolver"
    :members="members"
    :busy-action-id="inDetail.busyActionId"
    :action-error="inDetail.error || undefined"
    :form-errors="inDetail.formErrors"
    :settle-token="inDetail.settleToken"
    :loading-more="detailLoadingMore"
    @retry="loadDetail()"
    @close="closeDetail"
    @action="detailAction"
    @load-more="loadMoreDetail"
  />
</template>
