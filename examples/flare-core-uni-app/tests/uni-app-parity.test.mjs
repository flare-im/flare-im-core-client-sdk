import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join } from "node:path";
import { test } from "node:test";

const appRoot = join(import.meta.dirname, "..");
const clientSdkRoot = join(appRoot, "../..");
const monorepoRoot = join(clientSdkRoot, "..");

function read(path) {
  return readFileSync(join(appRoot, path), "utf8");
}

function readClientSdk(path) {
  return readFileSync(join(clientSdkRoot, path), "utf8");
}

function readFromMonorepo(path) {
  return readFileSync(join(monorepoRoot, path), "utf8");
}

test("uni-app mounts the local Vue workbench once through the TypeScript uni adapter", () => {
  const mainSource = read("src/main.ts");
  const pagesSource = read("pages.json");
  const pageSource = read("pages/index/index.vue");
  const routerSource = read("src/router.ts");

  assert.match(mainSource, /flare-core-typescript-sdk\/uni-app/);
  assert.match(mainSource, /configureProductionAppClientFactory\(\(\) => FlareCoreSdk\.createClient\(\)\)/);
  assert.match(mainSource, /installUniFlarePlatformAdapters\(\)/);
  assert.match(mainSource, /flare-core-vue-im-ui\/app\/style\.css/);
  assert.match(pageSource, /<FlareCoreApp\s*\/>/);
  assert.match(pageSource, /src\/FlareCoreApp\.vue/);
  for (const view of [
    "LoginView",
    "SyncProgressView",
    "WorkbenchLayout",
    "ConversationsView",
    "ChatPlaceholderView",
    "ChatView",
    "SdkLabView",
  ]) {
    assert.match(routerSource, new RegExp(`\\./views/${view}\\.vue`));
  }
  assert.doesNotMatch(routerSource, /Flare(ChatWorkspace|LoginScreen|WorkbenchLayout|HomeSyncScreen|ConversationsPanel|ChatPlaceholder|SdkLabPanel)/);
  assert.doesNotMatch(routerSource, /flare-core-vue-im-ui\/sdk-lab/);

  const pages = JSON.parse(pagesSource);
  assert.deepEqual(
    pages.pages.map((page) => page.path),
    ["pages/index/index"],
  );
});

test("uni-app wires platform media adapters used by the Flutter-aligned composer and SDK Lab", () => {
  const platformSource = read("src/platform/uniFlarePlatform.ts");

  assert.match(platformSource, /configureAppMediaPathPicker/);
  assert.match(platformSource, /configureAppMediaLocalPathResolver/);
  assert.match(platformSource, /chooseImage/);
  assert.match(platformSource, /chooseVideo/);
  assert.match(platformSource, /chooseMessageFile/);
  assert.match(platformSource, /installUniFlarePlatformAdapters/);
});

test("uni-app declares the Flutter workbench SDK capability surface it exercises", () => {
  const manifestSource = read("src/platform/flutterParityManifest.ts");

  for (const capability of [
    "auth.login",
    "conversation.bootstrapHomeTimeline",
    "conversation.openTimeline",
    "message.buildTypedMessage",
    "message.sendMessage",
    "message.searchMessages",
    "message.reactions",
    "media.uploadImage",
    "media.downloadFile",
    "capability.dispatch",
    "connection.notifyNetworkChange",
    "session.updateAccessToken",
    "events.subscribeEvents",
    "presence.subscribeUserPresence",
  ]) {
    assert.match(manifestSource, new RegExp(capability.replace(/[.]/g, "\\.")));
  }
});

test("app-composed Vue workbench used by uni-app exercises the same core SDK families as Flutter", () => {
  const clientSource = readFromMonorepo("flare-im-design/vue-im-ui/src/composables/useFlareCoreClient.ts");
  const sdkLabSource = read("src/views/SdkLabView.vue");
  const chatSource = read("src/views/ChatView.vue");

  for (const sdkCall of [
    "client.init",
    "client.login",
    "client.logout",
    "client.conversations.bootstrapHomeTimeline",
    "client.views.openTimeline",
    "client.conversations.getOneConversation",
    "client.messages.sendMessage",
    "client.messages.dispatchMessage",
    "client.messageBuilder.buildText",
    "client.media.uploadImage",
    "client.media.downloadFileToDownloads",
    "client.capabilities.dispatchCapability",
    "client.connection.notifyNetworkChange",
    "client.updateAccessToken",
    "client.events.subscribeEvents",
    "client.presence.subscribeUserPresence",
  ]) {
    assert.match(clientSource, new RegExp(sdkCall.replace(/[.]/g, "\\.")));
  }

  assert.match(sdkLabSource, /sdk\.runCapabilityOperation/);
  assert.match(sdkLabSource, /sdk\.runMediaOperation/);
  assert.match(sdkLabSource, /sdk\.runDispatch/);
  assert.match(chatSource, /FlareMessageList|MessageList/);
  assert.match(chatSource, /FlareComposer|EnhancedComposer/);
  assert.match(chatSource, /sendText|sendTypedMessage|sendSticker|sendEmoji/);
});

test("uni-app keeps one native page and app-owned router views for the workbench", () => {
  const pagesSource = read("pages.json");
  const routerSource = read("src/router.ts");

  assert.doesNotMatch(pagesSource, /pages\/login\/index/);
  assert.doesNotMatch(pagesSource, /pages\/conversations\/index/);
  assert.doesNotMatch(pagesSource, /pages\/chat\/index/);
  assert.doesNotMatch(pagesSource, /pages\/sdk-lab\/index/);
  assert.match(routerSource, /components:\s*\{\s*conversation: ConversationsView,\s*main: ChatView/s);
});
