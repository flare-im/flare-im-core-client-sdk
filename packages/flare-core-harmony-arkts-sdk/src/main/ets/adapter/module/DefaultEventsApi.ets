// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../contract/BridgeContract';
import type { EventsApi } from '../api/modules/events';
import type { EventCallback, EventSubscription, FlareImEventListener } from '../listener';
import {
  ConnectionEvent,
  LifecycleEvent,
  LifecycleEventName,
  MessageReceivedEvent,
  MessageSendAckEvent,
  MessageSendFailedEvent,
} from '../model';

class DefaultEventSubscription implements EventSubscription {
  constructor(
    readonly id: string,
    private readonly onDispose: () => void,
    public handler?: Object,
  ) {}

  unsubscribe(): void {
    this.onDispose();
  }
}

export class DefaultEventsApi implements EventsApi {
  private subscriptions: Map<number, DefaultEventSubscription> = new Map();
  private nextId = 1;

  constructor(private readonly bridge: NativeBridge) {}

  async subscribeEvents(request: Record<string, Object>): Promise<Record<string, Object>> {
    return this.bridge.invoke<Record<string, Object>>(NativeCallMap.eventSubscribe, request);
  }

  async subscribeEventsBatch(request: Record<string, Object>): Promise<Record<string, Object>> {
    return this.bridge.invoke<Record<string, Object>>(NativeCallMap.eventSubscribeBatch, request);
  }

  async unsubscribe(request: Record<string, Object>): Promise<void> {
    await this.bridge.invoke<void>(NativeCallMap.eventUnsubscribe, request);
  }

  async unsubscribeAll(): Promise<void> {
    this.subscriptions.clear();
    await this.bridge.invoke<void>(NativeCallMap.eventUnsubscribeAll);
  }

  emit(event: Object): void {
    const snapshot = Array.from(this.subscriptions.values());
    for (const subscription of snapshot) {
      const handler = subscription.handler;
      if (!handler) {
        continue;
      }
      if (typeof handler === 'function') {
        (handler as EventCallback<Object>)(event);
        continue;
      }
      this.dispatchToListener(handler as FlareImEventListener, event);
    }
  }

  addEventListener(listener: FlareImEventListener): EventSubscription {
    return this.register(listener);
  }

  removeEventListener(subscription: EventSubscription): void {
    subscription.unsubscribe();
  }

  onInitializing(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onInitialized(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onInitFailed(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onLoginSucceeded(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onLoginFailed(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onLoggedOut(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onDisposed(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onConnecting(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onConnectSuccess(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onConnectReady(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onConnectFailed(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onDisconnected(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onReconnecting(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onReconnectFailed(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onKickedOffline(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onUserTokenExpired(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageReceived(listener: EventCallback<MessageReceivedEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageReceivedBatch(listener: EventCallback<MessageReceivedBatchEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageSendAck(listener: EventCallback<MessageSendAckEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageSendFailed(listener: EventCallback<MessageSendFailedEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageRecalled(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageEdited(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageDeleted(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageReadReceipt(listener: EventCallback<ReadReceiptEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageReactionChanged(listener: EventCallback<ReactionChangedEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onInputStatusChanged(listener: EventCallback<TypingEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageBurned(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessagePinned(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onMessageUnpinned(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onNewConversation(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onConversationChanged(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onTotalUnreadMessageCountChanged(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onConversationDeleted(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onSyncServerStart(listener: EventCallback<SyncEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onSyncServerFinish(listener: EventCallback<SyncEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onSyncServerFailed(listener: EventCallback<SyncEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onSyncProgress(listener: EventCallback<ProgressEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onUploadProgress(listener: EventCallback<ProgressEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onDownloadProgress(listener: EventCallback<ProgressEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  onCapabilityChanged(listener: EventCallback<CapabilityEvent>): EventSubscription {
    return this.registerTyped(listener);
  }

  private register(handler: Object): EventSubscription {
    const subscriptionId = this.nextId++;
    const subscription = new DefaultEventSubscription(
      subscriptionId.toString(),
      () => this.subscriptions.delete(subscriptionId),
      handler,
    );
    this.subscriptions.set(subscriptionId, subscription);
    return subscription;
  }

  private registerTyped<T>(listener: EventCallback<T>): EventSubscription {
    return this.register((event: Object) => {
      listener(event as T);
    });
  }

  private dispatchToListener(listener: FlareImEventListener, event: Object): void {
    if ((event as LifecycleEvent).name !== undefined) {
      const lifecycle = event as LifecycleEvent;
      switch (lifecycle.name) {
        case LifecycleEventName.Initializing:
          listener.onInitializing?.(lifecycle);
          break;
        case LifecycleEventName.Initialized:
          listener.onInitialized?.(lifecycle);
          break;
        case LifecycleEventName.InitFailed:
          listener.onInitFailed?.(lifecycle);
          break;
        case LifecycleEventName.LoginSucceeded:
          listener.onLoginSucceeded?.(lifecycle);
          break;
        case LifecycleEventName.LoginFailed:
          listener.onLoginFailed?.(lifecycle);
          break;
        case LifecycleEventName.LoggedOut:
          listener.onLoggedOut?.(lifecycle);
          break;
        case LifecycleEventName.Disposed:
          listener.onDisposed?.(lifecycle);
          break;
        default:
          break;
      }
      return;
    }
    if ((event as ConnectionEvent).state !== undefined) {
      listener.onConnectSuccess?.(event as ConnectionEvent);
      return;
    }
    if ((event as MessageReceivedEvent).message !== undefined) {
      listener.onMessageReceived?.(event as MessageReceivedEvent);
      return;
    }
    if ((event as MessageSendAckEvent).ack !== undefined) {
      listener.onMessageSendAck?.(event as MessageSendAckEvent);
      return;
    }
    if ((event as MessageSendFailedEvent).clientMsgId !== undefined) {
      listener.onMessageSendFailed?.(event as MessageSendFailedEvent);
      return;
    }
  }
}
