<script setup lang="ts">
// Reference-app authentication screen. Authentication flows are not kit API
// (PUBLIC_API.md); this screen composes public kit components only.
import { computed, ref, useId, watch } from "vue";
import { LogInOutline } from "@flare-im/vue-ui/icon-glyphs";
import { useFlareI18n } from "@flare-im/vue-ui/i18n";
import { FlareBrandLogo, FlareButton, FlareFormField, FlareIcon, FlareInput, FlareSelect } from "@flare-im/vue-ui/components";
import authTechnology from "../assets/auth-technology.webp";

type AuthTransportMode = "websocket" | "quic" | "race";
type AuthServerField = "websocket" | "http" | "tenant" | "data" | "token" | "quic" | "tls";

const props = withDefaults(defineProps<{
  userId: string;
  token?: string;
  transportMode?: AuthTransportMode;
  wsUrl: string;
  quicUrl?: string;
  tlsCaCertPath?: string;
  httpUrl: string;
  dataUrl: string;
  tenantId: string;
  showTransportSelector?: boolean;
  /** 展开服务器地址与应用提供的 Token 配置。 */
  advancedOpen?: boolean;
  /** 为 true 时隐藏接入 token 输入框（走 SDK 托管：核心向 Gateway 签发并自动刷新）。
   *  默认 false 保持既有行为不变。 */
  hideToken?: boolean;
  /** 需要由宿主展示的连接字段。未传时保持完整接入配置。 */
  serverFields?: readonly AuthServerField[];
  loading?: boolean;
}>(), {
  token: "",
  transportMode: "websocket",
  quicUrl: "",
  tlsCaCertPath: "",
  showTransportSelector: false,
  advancedOpen: false,
  hideToken: false,
  serverFields: () => ["websocket", "http", "tenant", "data", "token"],
});

const emit = defineEmits<{
  (event: "update:userId", value: string): void;
  (event: "update:token", value: string): void;
  (event: "update:transportMode", value: AuthTransportMode): void;
  (event: "update:wsUrl", value: string): void;
  (event: "update:quicUrl", value: string): void;
  (event: "update:tlsCaCertPath", value: string): void;
  (event: "update:httpUrl", value: string): void;
  (event: "update:dataUrl", value: string): void;
  (event: "update:tenantId", value: string): void;
  (event: "login"): void;
}>();

const serverOpen = ref(false);
const authId = useId();
const serverPanelId = `flare-auth-server-${authId}`;
const userHintId = `flare-auth-user-hint-${authId}`;
const headingId = `flare-auth-heading-${authId}`;
watch(
  () => props.advancedOpen,
  (open) => {
    if (open) serverOpen.value = true;
  },
  { immediate: true },
);
const { t } = useFlareI18n();
const visibleServerFields = computed(() => new Set(props.serverFields));
const hasServerField = (field: AuthServerField): boolean => visibleServerFields.value.has(field);
const transportHint = computed(() => {
  if (props.transportMode === "quic") return t("login.transport.quicHint");
  if (props.transportMode === "race") return t("login.transport.raceHint");
  return t("login.transport.websocketHint");
});

const transportOptions = computed(() => [
  { label: t("login.transport.websocket"), value: "websocket" },
  { label: t("login.transport.quic"), value: "quic" },
  { label: t("login.transport.race"), value: "race" },
]);

function updateTransportMode(value: string): void {
  if (value === "quic" || value === "race") {
    emit("update:transportMode", value);
    return;
  }
  emit("update:transportMode", "websocket");
}

function submit(): void {
  if (!props.loading && props.userId.trim()) emit("login");
}
</script>

<template>
  <main class="auth-screen">
    <header class="auth-brand">
      <div class="auth-brand__content">
        <div class="auth-brand__intro">
          <div class="brand-lockup">
            <FlareBrandLogo :size="44" aria-hidden="true" />
            <h1>{{ t("login.brandTitle") }}</h1>
          </div>
          <p class="auth-brand__subtitle">{{ t("login.brandSubtitle") }}</p>
        </div>
        <div class="auth-brand__visual" aria-hidden="true">
          <img :src="authTechnology" width="1152" height="768" alt="" loading="lazy" decoding="async" />
        </div>
      </div>
    </header>

    <section class="auth-panel" :aria-labelledby="headingId">
      <div class="auth-panel__scroll">
        <header class="auth-panel__intro">
          <h2 :id="headingId">{{ t("login.welcomeTitle") }}</h2>
          <p>{{ t("login.welcomeHint") }}</p>
        </header>
        <form class="auth-panel__form" :aria-busy="loading || undefined" @submit.prevent="submit">
          <FlareFormField :label="t('login.userIdLabel')">
            <FlareInput
              size="lg"
              class="auth-user-input"
              :model-value="userId"
              :placeholder="t('login.userIdPlaceholder')"
              :aria-label="t('login.userIdLabel')"
              :aria-describedby="userHintId"
              autocomplete="username"
              name="userId"
              @update:model-value="emit('update:userId', $event)"
            >
              <template #prefix><FlareIcon name="person" :size="18" /></template>
            </FlareInput>
          </FlareFormField>

          <p :id="userHintId" class="auth-hint">{{ t("login.userIdHint") }}</p>

          <FlareFormField
            v-if="showTransportSelector"
            class="auth-transport-field"
            :label="t('login.transport.label')"
            :hint="transportHint"
          >
            <FlareSelect
              class="auth-transport-select"
              size="lg"
              :model-value="transportMode"
              :options="transportOptions"
              :title="t('login.transport.label')"
              @change="updateTransportMode"
            />
          </FlareFormField>

          <FlareButton
            class="auth-login-btn"
            type="submit"
            size="lg"
            block
            :icon="LogInOutline"
            :loading="loading"
            :disabled="loading || !userId.trim()"
          >
            {{ t("login.loginButton") }}
          </FlareButton>

          <button
            type="button"
            class="auth-server-toggle"
            :aria-expanded="serverOpen"
            :aria-controls="serverPanelId"
            @click="serverOpen = !serverOpen"
          >
            <span class="auth-server-toggle__copy">
              <strong>{{ t("login.serverToggle") }}</strong>
              <small>{{ t("login.serverSummary") }}</small>
            </span>
            <span class="auth-server-toggle__chevron" :class="{ 'is-open': serverOpen }">
              <FlareIcon name="chevron-down" :size="18" />
            </span>
          </button>

          <div class="auth-server-collapse" :class="{ 'is-open': serverOpen }">
            <div v-show="serverOpen" :id="serverPanelId" class="auth-server-fields">
              <p class="auth-server-fields__hint">{{ t("login.serverHint") }}</p>
              <FlareFormField v-if="hasServerField('websocket')" :label="t('login.wsUrlLabel')">
                <FlareInput
                  size="lg"
                  :model-value="wsUrl"
                  :aria-label="t('login.wsUrlLabel')"
                  inputmode="url"
                  autocomplete="url"
                  @update:model-value="emit('update:wsUrl', $event)"
                />
              </FlareFormField>
              <FlareFormField v-if="showTransportSelector && hasServerField('quic')" :label="t('login.quicUrlLabel')">
                <FlareInput
                  size="lg"
                  :model-value="quicUrl"
                  :aria-label="t('login.quicUrlLabel')"
                  placeholder="quic://127.0.0.1:60052"
                  @update:model-value="emit('update:quicUrl', $event)"
                />
              </FlareFormField>
              <FlareFormField v-if="showTransportSelector && hasServerField('tls')" :label="t('login.tlsCaCertPathLabel')">
                <FlareInput
                  size="lg"
                  :model-value="tlsCaCertPath"
                  :aria-label="t('login.tlsCaCertPathLabel')"
                  placeholder="/path/to/flare-im-core/certs/server.crt"
                  @update:model-value="emit('update:tlsCaCertPath', $event)"
                />
              </FlareFormField>
              <FlareFormField v-if="hasServerField('http')" :label="t('login.httpUrlLabel')">
                <FlareInput
                  size="lg"
                  :model-value="httpUrl"
                  :aria-label="t('login.httpUrlLabel')"
                  placeholder="https://example.com/api"
                  inputmode="url"
                  autocomplete="url"
                  @update:model-value="emit('update:httpUrl', $event)"
                />
              </FlareFormField>
              <FlareFormField v-if="hasServerField('tenant')" :label="t('login.tenantLabel')">
                <FlareInput
                  size="lg"
                  :model-value="tenantId"
                  :aria-label="t('login.tenantLabel')"
                  @update:model-value="emit('update:tenantId', $event)"
                />
              </FlareFormField>
              <FlareFormField v-if="hasServerField('data')" :label="t('login.dataUrlLabel')">
                <FlareInput
                  size="lg"
                  :model-value="dataUrl"
                  :aria-label="t('login.dataUrlLabel')"
                  @update:model-value="emit('update:dataUrl', $event)"
                />
              </FlareFormField>
              <FlareFormField v-if="hasServerField('token') && !hideToken" :label="t('login.tokenLabel')">
                <FlareInput
                  size="lg"
                  :model-value="token"
                  :aria-label="t('login.tokenLabel')"
                  secure
                  autocomplete="current-password"
                  @update:model-value="emit('update:token', $event)"
                />
              </FlareFormField>
            </div>
          </div>
        </form>

        <footer class="auth-panel__footer">
          <span class="auth-panel__footer-icon"><FlareIcon name="lock" :size="16" /></span>
          <p class="auth-footnote">{{ t("login.securityNote") }}</p>
        </footer>
      </div>
    </section>
  </main>
</template>
