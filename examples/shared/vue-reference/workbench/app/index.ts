// Shared Flare IM Vue workbench building blocks.
// Platform example apps own their App.vue, router, route guards, and page
// registration. This package exposes reusable views, layouts, state, and
// platform adapter hooks so each runtime can assemble its own shell.
export { default as FlareWorkbenchLayout } from "./components/FlareWorkbenchLayout.vue";
export { default as FlareLoginScreen } from "./components/FlareLoginScreen.vue";
export { default as FlareHomeSyncScreen } from "./components/FlareHomeSyncScreen.vue";
export { default as FlareConversationsPanel } from "./components/FlareConversationsPanel.vue";
export { default as FlareChatPlaceholder } from "./components/FlareChatPlaceholder.vue";
export { default as FlareChatWorkspace } from "./components/FlareChatWorkspace.vue";
export { default as FlareSdkLabPanel } from "./components/FlareSdkLabPanel.vue";
export {
  getFlareSdkSingleton,
  provideFlareSdk,
  useFlareSdk,
  type FlareSdkContext,
} from "./sdk/flareSdkContext";
export * from "./ui/components";
export {
  useConversationListModel,
} from "./state/useConversationListModel";
export { useFlareI18n, type FlareLocale } from "./shared/i18n";
export {
  conversationTitle,
  resolveConversationPeer,
} from "./shared/conversationTitle";
export { locateTimelineMessage } from "./shared/locateTimelineMessage";
export { DraftIdleScheduler } from "./shared/draftIdleScheduler";
export {
  createMessageOperationAdapter,
} from "./message-enhancements/messageOperations";
export {
  resolveComposerAction,
  resolveMessageMenuActions,
  type ComposerActionDefinition,
} from "./message-enhancements/messageTypeRegistry";
export {
  useMessageInteractionState,
} from "./message-enhancements/useMessageInteractionState";
export {
  default as FlareComposerPayloadModal,
} from "./message-enhancements/components/ComposerPayloadModal.vue";
export {
  default as FlareForwardModal,
} from "./message-enhancements/components/ForwardModal.vue";
export {
  FlareComposerMediaPreview,
} from "@flare-im/vue-ui/components";
export type {
  BatchOperationResult,
  ComposerPayloadRequest,
  EnhancedMessageKind,
  ForwardMode,
  MediaComposerPreviewItem,
  MessageOperationSdk,
  MessagePinScope,
} from "./message-enhancements/types";
export {
  createProductionAppClient,
  configureProductionAppClientFactory,
  type ProductionAppClientFactory,
} from "./infrastructure/sdk/createProductionAppClient";
export {
  configureAppMediaLocalPathResolver,
  createAppMediaResolver,
  resolveAppMediaLocalPath,
} from "./infrastructure/media/appMediaResolver";
export { configureAppPlatform, appPlatformOptions } from "./infrastructure/platform/appPlatform";
export {
  canRevealDownloadedMedia,
  revealDownloadedMediaFile,
  startBrowserDownload,
} from "./infrastructure/media/downloadedMediaActions";
export {
  configureDesktopNotifications,
  emitDesktopNotification,
  playDesktopNotificationSound,
  setDesktopUnreadCount,
  type DesktopNotificationAdapter,
  type DesktopNotificationKind,
  type DesktopNotificationPayload,
} from "./infrastructure/desktop/desktopNotifications";
export {
  appTransportSelectorTlsCaCertPath,
  appTransportSelectorRuntimeStatus,
  appTransportSelectorProfile,
  configureAppTransportSelector,
  isAppTransportSelectorEnabled,
  type AppTransportSelectorOptions,
} from "./infrastructure/transport/appTransportSelector";
export { sdkMediaProxyFields, devMediaHttpBaseUrl } from "./runtime/mediaProxy";

export { messageSearchRange, messageSearchRangeLabels, type MessageSearchRangePreset } from "./shared/messageSearchRanges";
