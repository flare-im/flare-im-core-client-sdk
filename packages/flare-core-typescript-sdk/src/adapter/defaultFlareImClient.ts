// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../contract/bridge_contract';
import type { FlareImClient } from '../api';
import type { ConnectionApi } from '../api/modules/connection';
import type { ConversationsApi } from '../api/modules/conversations';
import type { MessageBuilderApi } from '../api/modules/message_builder';
import type { MessagesApi } from '../api/modules/messages';
import type { SyncApi } from '../api/modules/sync';
import type { UserApi } from '../api/modules/user';
import type { PresenceApi } from '../api/modules/presence';
import type { MediaApi } from '../api/modules/media';
import type { CapabilitiesApi } from '../api/modules/capabilities';
import type { ViewsApi } from '../api/modules/views';
import type { EventsApi } from '../api/modules/events';
import type { DiagnosticsApi } from '../api/modules/diagnostics';
import type { CreateClientRequest, CreateClientResponse, CurrentUserIdResponse, LoginRequest, SdkConfig, UpdateAccessTokenRequest } from '../api/types';
import type { HeartbeatEffectiveIntervalResponse, SetHeartbeatAppStateRequest, SetHeartbeatNatTimeoutRequest } from '../model';
import { LifecycleEventName } from '../model';
import { emitLifecycleEvent, invokeBool, invokeMap, invokeVoid, sdkErrorPayloadFromError, userIdFromRequest } from './codec/nativeInvoke';
import { setHeartbeatAppStateRequestToMap, setHeartbeatNatTimeoutRequestToMap } from './codec/wireCodec';
import { DefaultEventsApi } from './module/DefaultEventsApi';
import { DefaultConnectionApi } from './module/DefaultConnectionApi';
import { DefaultConversationsApi } from './module/DefaultConversationsApi';
import { DefaultMessagesApi } from './module/DefaultMessagesApi';
import { DefaultSyncApi } from './module/DefaultSyncApi';
import { DefaultUserApi } from './module/DefaultUserApi';
import { DefaultPresenceApi } from './module/DefaultPresenceApi';
import { DefaultMediaApi } from './module/DefaultMediaApi';
import { DefaultCapabilitiesApi } from './module/DefaultCapabilitiesApi';
import { DefaultViewsApi } from './module/DefaultViewsApi';
import { DefaultDiagnosticsApi } from './module/DefaultDiagnosticsApi';
import { DefaultMessageBuilderApi } from './module/DefaultMessageBuilderApi';

export class DefaultFlareImClient implements FlareImClient {
  readonly connection: ConnectionApi;
  readonly conversations: ConversationsApi;
  readonly messageBuilder: MessageBuilderApi;
  readonly messages: MessagesApi;
  readonly sync: SyncApi;
  readonly user: UserApi;
  readonly presence: PresenceApi;
  readonly media: MediaApi;
  readonly capabilities: CapabilitiesApi;
  readonly views: ViewsApi;
  readonly events: EventsApi;
  readonly diagnostics: DiagnosticsApi;
  private readonly bridge: NativeBridge;

  constructor(bridge: NativeBridge) {
    this.bridge = bridge;
    this.connection = new DefaultConnectionApi(bridge);
    this.conversations = new DefaultConversationsApi(bridge);
    this.messageBuilder = new DefaultMessageBuilderApi(bridge);
    this.messages = new DefaultMessagesApi(bridge);
    this.sync = new DefaultSyncApi(bridge);
    this.user = new DefaultUserApi(bridge);
    this.presence = new DefaultPresenceApi(bridge);
    this.media = new DefaultMediaApi(bridge);
    this.capabilities = new DefaultCapabilitiesApi(bridge);
    this.views = new DefaultViewsApi(bridge);
    this.events = new DefaultEventsApi(bridge);
    this.diagnostics = new DefaultDiagnosticsApi(bridge);
  }

  async create(request: CreateClientRequest): Promise<CreateClientResponse> {
    return await this.bridge.invoke<CreateClientResponse>(NativeCallMap.sdkCreate, request);
  }
  async init(request: SdkConfig): Promise<void> {
    emitLifecycleEvent(this.events as unknown as DefaultEventsApi, LifecycleEventName.Initializing, "sdk.init");
    try {
      await invokeVoid(this.bridge, NativeCallMap.sdkInit, request);
      emitLifecycleEvent(this.events as unknown as DefaultEventsApi, LifecycleEventName.Initialized, "sdk.init");
    } catch (error) {
      emitLifecycleEvent(
        this.events as unknown as DefaultEventsApi,
        LifecycleEventName.InitFailed,
        "sdk.init",
        undefined,
        sdkErrorPayloadFromError(error as unknown, "sdk.init"),
      );
      throw error;
    }
  }
  async uninit(): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkUninit);
  }
  async login(request: LoginRequest): Promise<void> {
    const userId = userIdFromRequest(request);
    try {
      await invokeVoid(this.bridge, NativeCallMap.sdkLogin, request);
      emitLifecycleEvent(this.events as unknown as DefaultEventsApi, LifecycleEventName.LoginSucceeded, "sdk.login", userId);
    } catch (error) {
      emitLifecycleEvent(
        this.events as unknown as DefaultEventsApi,
        LifecycleEventName.LoginFailed,
        "sdk.login",
        userId,
        sdkErrorPayloadFromError(error as unknown, "sdk.login"),
      );
      throw error;
    }
  }
  async prepare(request: LoginRequest): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkPrepare, request);
  }
  async connect(request: LoginRequest): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkConnect, request);
  }
  async updateAccessToken(request: UpdateAccessTokenRequest): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkUpdateAccessToken, request);
  }
  async setHeartbeatAppState(request: SetHeartbeatAppStateRequest): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkSetHeartbeatAppState, setHeartbeatAppStateRequestToMap(request));
  }
  async setHeartbeatNatTimeout(request: SetHeartbeatNatTimeoutRequest): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkSetHeartbeatNatTimeout, setHeartbeatNatTimeoutRequestToMap(request));
  }
  async heartbeatEffectiveInterval(): Promise<HeartbeatEffectiveIntervalResponse> {
    return await invokeMap(this.bridge, NativeCallMap.sdkHeartbeatEffectiveInterval) as unknown as HeartbeatEffectiveIntervalResponse;
  }
  async logout(): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkLogout);
    emitLifecycleEvent(this.events as unknown as DefaultEventsApi, LifecycleEventName.LoggedOut, "sdk.logout");
  }
  async dispose(): Promise<void> {
    await this.events.unsubscribeAll();
    await invokeVoid(this.bridge, NativeCallMap.sdkDispose);
    emitLifecycleEvent(this.events as unknown as DefaultEventsApi, LifecycleEventName.Disposed, "sdk.dispose");
  }
  async hardReset(): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.sdkHardReset);
  }
  async currentUserId(): Promise<CurrentUserIdResponse> {
    return await this.bridge.invoke<CurrentUserIdResponse>(NativeCallMap.sdkCurrentUserId);
  }
  async isConnected(): Promise<boolean> {
    return await invokeBool(this.bridge, NativeCallMap.sdkIsConnected);
  }
  async sessionActive(): Promise<boolean> {
    return await invokeBool(this.bridge, NativeCallMap.sdkSessionActive);
  }
}
