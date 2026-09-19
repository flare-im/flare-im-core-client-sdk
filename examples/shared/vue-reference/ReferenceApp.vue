<script setup lang="ts">
import { watch } from "vue";
import { useRouter } from "vue-router";
import { FlareUiProvider } from "@flare-im/vue-ui/components";
import { appPlatformOptions, createAppMediaResolver, provideFlareSdk } from "./workbench/app";
import ToastHost from "./workbench/app/components/ToastHost.vue";

const sdk = provideFlareSdk();
const mediaResolver = createAppMediaResolver(sdk);
const platform = appPlatformOptions();
const router = useRouter();

watch(sdk.loggedIn, (loggedIn) => {
  if (!loggedIn && router.currentRoute.value.name !== "login") {
    void router.replace({ name: "login" });
  }
});
</script>

<template>
  <FlareUiProvider layout-mode="auto" :media-resolver="mediaResolver" :platform="platform">
    <router-view />
    <ToastHost />
  </FlareUiProvider>
</template>
