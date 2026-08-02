// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/bridge_contract';
import type { EventsApi } from '../../api/modules/events';
import type { SubscribeEventsRequest, Subscription, UnsubscribeRequest } from '../../api/types';
import type { EventCallback, EventSubscription, FlareImEventListener } from '../../listener';
import {
  CapabilityEvent,
  CapabilityEventName,
  ConnectionEvent,
  ConnectionEventName,
  ConversationEvent,
  ConversationEventName,
  LifecycleEvent,
  LifecycleEventName,
  MessageEventName,
  MessageMutationEvent,
  MessageReceivedBatchEvent,
  MessageReceivedEvent,
  MessageSendAckEvent,
  MessageSendFailedEvent,
  PresenceChangedEvent,
  ProgressEventName,
  ReactionChangedEvent,
  ReadReceiptEvent,
  SdkConnectionState,
  SdkErrorPayload,
  SyncEvent,
  SyncEventName,
  TypingAggregateEvent,
  TypingEvent,
  ViewUpdate,
  ProgressEvent as SdkProgressEvent,
} from '../../model';
import { messageFromJson, sendAckFromJson, viewUpdateFromJson, wireDecodeResponse } from '../codec/wireCodec';
import { FlareSdkException } from '../../bridge/flareSdkException';

const EVENT_CODE_CONNECTION_CONNECTED = 1001;
const EVENT_CODE_CONNECTION_DISCONNECTED = 1002;
const EVENT_CODE_CONNECTION_RECONNECTING = 1003;
const EVENT_CODE_CONNECTION_STATE_CHANGED = 1004;
const EVENT_CODE_CONNECTION_SYNC_STATE_CHANGED = 1005;
const EVENT_CODE_CONNECTION_SERVER_ERROR = 1006;
const EVENT_CODE_CONNECTION_KICKED_OFF = 1007;
const EVENT_CODE_CONNECTION_TOKEN_EXPIRED = 1008;
const EVENT_CODE_MESSAGE_RECEIVED = 2001;
const EVENT_CODE_MESSAGE_RECEIVED_BATCH = 2002;
const EVENT_CODE_MESSAGE_SEND_ACK = 2003;
const EVENT_CODE_MESSAGE_SEND_FAILED = 2004;
const EVENT_CODE_MESSAGE_RECALLED = 2005;
const EVENT_CODE_MESSAGE_TYPING = 2006;
const EVENT_CODE_MESSAGE_CAPABILITY = 2007;
const EVENT_CODE_MESSAGE_EDITED = 2008;
const EVENT_CODE_MESSAGE_REACTION_CHANGED = 2009;
const EVENT_CODE_MESSAGE_DELETED = 2010;
const EVENT_CODE_MESSAGE_READ_RECEIPT = 2011;
const EVENT_CODE_MESSAGE_RETENTION_SCHEDULED = 2012;
const EVENT_CODE_MESSAGE_RETENTION_EXPIRED = 2013;
const EVENT_CODE_MESSAGE_RETENTION_PURGED = 2014;
const EVENT_CODE_MESSAGE_PINNED = 2015;
const EVENT_CODE_MESSAGE_UNPINNED = 2016;
const EVENT_CODE_MESSAGE_MARKED = 2017;
const EVENT_CODE_MESSAGE_UNMARKED = 2018;
const EVENT_CODE_MESSAGE_PRESENCE_CHANGED = 2019;
const EVENT_CODE_MESSAGE_CUSTOM = 2020;
const EVENT_CODE_MESSAGE_TYPING_AGGREGATE = 2021;
const EVENT_CODE_CONVERSATION_SYNCED = 3001;
const EVENT_CODE_CONVERSATION_CREATED = 3002;
const EVENT_CODE_CONVERSATION_UPDATED = 3003;
const EVENT_CODE_CONVERSATION_UNREAD_COUNT_CHANGED = 3004;
const EVENT_CODE_CONVERSATION_DELETED = 3005;
const EVENT_CODE_NOTIFICATION_RECEIVED = 3501;
const EVENT_CODE_SYNC_STARTED = 4001;
const EVENT_CODE_SYNC_FINISHED = 4002;
const EVENT_CODE_SYNC_FAILED = 4003;
const EVENT_CODE_SYNC_PROGRESS = 4004;
const EVENT_CODE_SYNC_TASK_COMPLETED = 4005;
const EVENT_CODE_SYNC_STATE_CHANGED = 4006;
const EVENT_CODE_SYNC_RESYNC_NEEDED = 4007;
const EVENT_CODE_SYNC_READINESS = 4008;
const EVENT_CODE_EXTENSION_EVENT = 5001;
const EVENT_CODE_VIEW_UPDATED = 6001;

const WEB_EVENT_TYPE_BY_CHANNEL: Record<string, number> = {
  "im://connected": EVENT_CODE_CONNECTION_CONNECTED,
  "im://disconnected": EVENT_CODE_CONNECTION_DISCONNECTED,
  "im://reconnecting": EVENT_CODE_CONNECTION_RECONNECTING,
  "im://state": EVENT_CODE_CONNECTION_STATE_CHANGED,
  "im://sync_state_changed": EVENT_CODE_CONNECTION_SYNC_STATE_CHANGED,
  "im://server_error": EVENT_CODE_CONNECTION_SERVER_ERROR,
  "im://kicked_off": EVENT_CODE_CONNECTION_KICKED_OFF,
  "im://token_expired": EVENT_CODE_CONNECTION_TOKEN_EXPIRED,
  "im://message": EVENT_CODE_MESSAGE_RECEIVED,
  "im://message_batch": EVENT_CODE_MESSAGE_RECEIVED_BATCH,
  "im://send_ack": EVENT_CODE_MESSAGE_SEND_ACK,
  "im://send_failed": EVENT_CODE_MESSAGE_SEND_FAILED,
  "im://message_recalled": EVENT_CODE_MESSAGE_RECALLED,
  "im://typing": EVENT_CODE_MESSAGE_TYPING,
  "im://message_capability": EVENT_CODE_MESSAGE_CAPABILITY,
  "im://message_edited": EVENT_CODE_MESSAGE_EDITED,
  "im://message_reaction_changed": EVENT_CODE_MESSAGE_REACTION_CHANGED,
  "im://message_deleted": EVENT_CODE_MESSAGE_DELETED,
  "im://message_read_receipt": EVENT_CODE_MESSAGE_READ_RECEIPT,
  "im://message_retention_scheduled": EVENT_CODE_MESSAGE_RETENTION_SCHEDULED,
  "im://message_retention_expired": EVENT_CODE_MESSAGE_RETENTION_EXPIRED,
  "im://message_retention_purged": EVENT_CODE_MESSAGE_RETENTION_PURGED,
  "im://message_pinned": EVENT_CODE_MESSAGE_PINNED,
  "im://message_unpinned": EVENT_CODE_MESSAGE_UNPINNED,
  "im://message_marked": EVENT_CODE_MESSAGE_MARKED,
  "im://message_unmarked": EVENT_CODE_MESSAGE_UNMARKED,
  "im://presence_changed": EVENT_CODE_MESSAGE_PRESENCE_CHANGED,
  "im://message_custom_event": EVENT_CODE_MESSAGE_CUSTOM,
  "im://message_typing_aggregate": EVENT_CODE_MESSAGE_TYPING_AGGREGATE,
  "im://conversations_synced": EVENT_CODE_CONVERSATION_SYNCED,
  "im://conversation_created": EVENT_CODE_CONVERSATION_CREATED,
  "im://conversation_updated": EVENT_CODE_CONVERSATION_UPDATED,
  "im://unread_count_changed": EVENT_CODE_CONVERSATION_UNREAD_COUNT_CHANGED,
  "im://conversation_deleted": EVENT_CODE_CONVERSATION_DELETED,
  "im://notification": EVENT_CODE_NOTIFICATION_RECEIVED,
  "im://sync_started": EVENT_CODE_SYNC_STARTED,
  "im://sync_finished": EVENT_CODE_SYNC_FINISHED,
  "im://sync_failed": EVENT_CODE_SYNC_FAILED,
  "im://sync_progress": EVENT_CODE_SYNC_PROGRESS,
  "im://sync_completed": EVENT_CODE_SYNC_TASK_COMPLETED,
  "im://sync_notify_state_changed": EVENT_CODE_SYNC_STATE_CHANGED,
  "im://resync_needed": EVENT_CODE_SYNC_RESYNC_NEEDED,
  "im://sync_readiness": EVENT_CODE_SYNC_READINESS,
  "im://extension": EVENT_CODE_EXTENSION_EVENT,
  "im://view_updated": EVENT_CODE_VIEW_UPDATED,
};

export const WEB_EVENT_CHANNELS = Object.freeze(Object.keys(WEB_EVENT_TYPE_BY_CHANNEL));

export function eventTypeForWebChannel(channel: string): number | undefined {
  return WEB_EVENT_TYPE_BY_CHANNEL[channel];
}

function eventPayloadRecord(payload: unknown): Record<string, unknown> {
  const decoded = wireDecodeResponse(payload);
  return decoded && typeof decoded === 'object' && !Array.isArray(decoded)
    ? decoded as Record<string, unknown>
    : {};
}

function invalidEventField(field: string, expected: string): never {
  throw new FlareSdkException('invalidParameter', `invalid event payload field: ${field}`, 'event.decode', { field, expected });
}

function requiredString(value: unknown, field: string): string {
  if (typeof value === 'string' && value.length > 0) return value;
  return invalidEventField(field, 'non-empty string');
}

function optionalString(value: unknown, field: string): string | undefined {
  if (value === undefined || value === null) return undefined;
  if (typeof value === 'string' && value.length > 0) return value;
  return invalidEventField(field, 'non-empty string');
}

function requiredNumber(value: unknown, field: string): number {
  if (typeof value === 'number' && Number.isFinite(value)) return value;
  return invalidEventField(field, 'finite number');
}

function optionalNumber(value: unknown, field: string): number | undefined {
  if (value === undefined || value === null) return undefined;
  return requiredNumber(value, field);
}

function requiredBoolean(value: unknown, field: string): boolean {
  if (typeof value === 'boolean') return value;
  return invalidEventField(field, 'boolean');
}

function optionalBoolean(value: unknown, field: string): boolean | undefined {
  if (value === undefined || value === null) return undefined;
  return requiredBoolean(value, field);
}

function requiredArray(value: unknown, field: string): unknown[] {
  if (Array.isArray(value)) return value;
  return invalidEventField(field, 'array');
}

function stringRecord(value: unknown, field: string): Record<string, string> {
  if (value === undefined || value === null) return {};
  const record = eventPayloadRecord(value);
  const out: Record<string, string> = {};
  for (const [key, item] of Object.entries(record)) {
    if (typeof item !== 'string') invalidEventField(`${field}.${key}`, 'string');
    out[key] = item;
  }
  return out;
}

function sdkErrorPayloadFromJson(value: unknown): SdkErrorPayload | undefined {
  if (value === undefined || value === null) return undefined;
  const decoded = wireDecodeResponse(value);
  if (typeof decoded === 'string') return undefined;
  if (!decoded || typeof decoded !== 'object' || Array.isArray(decoded)) invalidEventField('error', 'object');
  const record = decoded as Record<string, unknown>;
  return {
    code: requiredString(record.code, 'error.code'),
    message: requiredString(record.message, 'error.message'),
    operation: optionalString(record.operation, 'error.operation'),
    retryable: optionalBoolean(record.retryable, 'error.retryable'),
    details: stringRecord(record.details, 'error.details'),
  };
}

function connectionStateFromWire(value: unknown): SdkConnectionState {
  const raw = String(value ?? '').trim().toLowerCase();
  switch (raw) {
    case 'connecting': return SdkConnectionState.Connecting;
    case 'connected': return SdkConnectionState.Connected;
    case 'ready': return SdkConnectionState.Ready;
    case 'reconnecting': return SdkConnectionState.Reconnecting;
    case 'disconnected': return SdkConnectionState.Disconnected;
    default: throw new FlareSdkException('invalidParameter', `invalid connection state: ${raw || '<empty>'}`, 'event.decode', { field: 'state' });
  }
}

function connectionEvent(name: ConnectionEventName, state: SdkConnectionState, event: string, payload: unknown): ConnectionEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const { error: rawError, ...rest } = record;
  const error = sdkErrorPayloadFromJson(rawError);
  const reason = optionalString(record.reason, 'reason');
  const attempt = optionalNumber(record.attempt, 'attempt');
  return {
    ...rest,
    type: 'connection',
    event,
    name,
    state,
    ...(reason !== undefined ? { reason } : {}),
    ...(attempt !== undefined ? { attempt } : {}),
    ...(error ? { error } : {}),
  };
}

function connectionStateChangedEvent(payload: unknown): ConnectionEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const state = connectionStateFromWire(record.state);
  const name = connectionEventNameFromState(state);
  return connectionEvent(name, state, 'state_changed', record);
}

function connectionEventNameFromState(state: SdkConnectionState): ConnectionEventName {
  switch (state) {
    case SdkConnectionState.Connecting: return ConnectionEventName.Connecting;
    case SdkConnectionState.Connected: return ConnectionEventName.Connected;
    case SdkConnectionState.Ready: return ConnectionEventName.Ready;
    case SdkConnectionState.Reconnecting: return ConnectionEventName.Reconnecting;
    case SdkConnectionState.Disconnected: return ConnectionEventName.Disconnected;
  }
}

function messageReceivedEvent(payload: unknown): MessageReceivedEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { type: 'message', event: 'received', message: messageFromJson(record) };
}

function messageReceivedBatchEvent(payload: unknown): MessageReceivedBatchEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const source = requiredArray(record.messages, 'messages');
  return { ...record, type: 'message', event: 'received_batch', messages: source.map((item) => messageFromJson(item)) };
}

function messageSendAckEvent(payload: unknown): MessageSendAckEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { ...record, type: 'message', event: 'send_ack', ack: sendAckFromJson(record) };
}

function messageSendFailedEvent(payload: unknown): MessageSendFailedEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const { error: rawError, ...rest } = record;
  const error = sdkErrorPayloadFromJson(rawError);
  return {
    ...rest,
    type: 'message',
    event: 'send_failed',
    clientMsgId: requiredString(record.clientMsgId, 'clientMsgId'),
    reason: requiredString(record.reason, 'reason'),
    ...(error ? { error } : {}),
  };
}

function messageMutationEvent(name: MessageEventName, event: string, payload: unknown): MessageMutationEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return {
    ...record,
    type: 'message',
    event,
    name,
    conversationId: requiredString(record.conversationId, 'conversationId'),
    messageId: optionalString(record.messageId, 'messageId'),
    serverMsgId: optionalString(record.serverMsgId, 'serverMsgId'),
    userId: optionalString(record.userId, 'userId'),
    reason: optionalString(record.reason, 'reason'),
  };
}

function typingEvent(payload: unknown): TypingEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { ...record, type: 'message', event: 'typing', conversationId: requiredString(record.conversationId, 'conversationId'), userId: requiredString(record.userId, 'userId'), typing: requiredBoolean(record.typing, 'typing') };
}

function typingAggregateEvent(payload: unknown): TypingAggregateEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const typingUserIds = requiredArray(record.typingUserIds, 'typingUserIds').map((item, index) => requiredString(item, `typingUserIds.${index}`));
  return { ...record, type: 'message', event: 'typing_aggregate', name: MessageEventName.TypingAggregate, conversationId: requiredString(record.conversationId, 'conversationId'), typingUserIds, typingCount: requiredNumber(record.typingCount, 'typingCount') };
}

function readReceiptEvent(payload: unknown): ReadReceiptEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { ...record, type: 'message', event: 'read_receipt', conversationId: requiredString(record.conversationId, 'conversationId'), userId: requiredString(record.userId, 'userId'), readSeq: requiredNumber(record.readSeq, 'readSeq') };
}

function reactionChangedEvent(payload: unknown): ReactionChangedEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { ...record, type: 'message', event: 'reaction_changed', conversationId: requiredString(record.conversationId, 'conversationId'), serverMsgId: requiredString(record.serverMsgId, 'serverMsgId'), userId: requiredString(record.userId, 'userId'), emoji: requiredString(record.emoji, 'emoji'), action: requiredNumber(record.action, 'action') };
}

function presenceChangedEvent(payload: unknown): PresenceChangedEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { ...record, type: 'presence', event: 'changed', conversationId: optionalString(record.conversationId, 'conversationId'), userId: requiredString(record.userId, 'userId'), status: requiredString(record.status, 'status'), extra: stringRecord(record.extra, 'extra') };
}

function capabilityEvent(payload: unknown): CapabilityEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const eventName = String(record.name ?? record.event ?? '').trim() === CapabilityEventName.Unavailable
    ? CapabilityEventName.Unavailable
    : CapabilityEventName.Changed;
  return { ...record, type: 'capability', event: eventName, name: eventName, capability: optionalString(record.capability, 'capability'), reason: optionalString(record.reason, 'reason') };
}

function conversationEvent(name: ConversationEventName, event: string, payload: unknown): ConversationEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const conversationId = optionalString(record.conversationId, 'conversationId');
  const conversationIds = Array.isArray(record.conversationIds)
    ? record.conversationIds.map((item, index) => requiredString(item, `conversationIds.${index}`))
    : conversationId ? [conversationId] : [];
  return { ...record, type: 'conversation', event, name, conversationId, conversationIds, unreadCount: optionalNumber(record.unreadCount, 'unreadCount') };
}

function syncEvent(name: SyncEventName, event: string, payload: unknown): SyncEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const { error: rawError, ...rest } = record;
  const error = sdkErrorPayloadFromJson(rawError);
  return {
    ...rest,
    type: 'sync',
    event,
    name,
    trigger: optionalString(record.trigger, 'trigger'),
    phase: optionalString(record.phase, 'phase'),
    task: optionalString(record.task, 'task'),
    progress: optionalNumber(record.progress, 'progress'),
    ...(error ? { error } : {}),
    ...(typeof rawError === 'string' ? { message: rawError } : {}),
  };
}

function syncProgressEvent(payload: unknown): SdkProgressEvent & Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  const progress = requiredNumber(record.progress, 'progress');
  return {
    ...record,
    type: 'sync',
    event: 'progress',
    name: ProgressEventName.SyncProgress,
    operation: optionalString(record.task, 'task') ?? 'sync',
    current: progress,
    total: 100,
    taskId: optionalString(record.task, 'task'),
    detail: optionalString(record.detail, 'detail'),
  };
}

function viewUpdatedEvent(payload: unknown): ViewUpdate & Record<string, unknown> {
  return { ...viewUpdateFromJson(wireDecodeResponse(payload)), type: 'view', event: 'updated' };
}

function notificationReceivedEvent(payload: unknown): Record<string, unknown> {
  const record = eventPayloadRecord(payload);
  return { type: 'notification', event: 'received', message: messageFromJson(record) };
}

function contractEvent(type: string, event: string, payload: unknown): Record<string, unknown> {
  return { ...eventPayloadRecord(payload), type, event };
}

function emittedEventRecord(event: unknown): { type?: unknown; event?: unknown; name?: unknown } {
  return event && typeof event === 'object'
    ? event as { type?: unknown; event?: unknown; name?: unknown }
    : {};
}

function eventTypeIs(event: unknown, type: string): boolean {
  return String(emittedEventRecord(event).type ?? '') === type;
}

function eventEventIs(event: unknown, type: string, eventName: string): boolean {
  const record = emittedEventRecord(event);
  return String(record.type ?? '') === type && String(record.event ?? '') === eventName;
}

function eventNameIs(event: unknown, type: string, name: string): boolean {
  const record = emittedEventRecord(event);
  return String(record.type ?? '') === type && String(record.name ?? '') === name;
}

function lifecycleNameIs(event: unknown, name: string): boolean {
  return String(emittedEventRecord(event).name ?? '') === name;
}

export function nativeEventFromCode(eventType: number, payload: unknown): unknown {
  switch (eventType) {
    case EVENT_CODE_CONNECTION_CONNECTED: return connectionEvent(ConnectionEventName.Connected, SdkConnectionState.Connected, "connected", payload);
    case EVENT_CODE_CONNECTION_DISCONNECTED: return connectionEvent(ConnectionEventName.Disconnected, SdkConnectionState.Disconnected, "disconnected", payload);
    case EVENT_CODE_CONNECTION_RECONNECTING: return connectionEvent(ConnectionEventName.Reconnecting, SdkConnectionState.Reconnecting, "reconnecting", payload);
    case EVENT_CODE_CONNECTION_STATE_CHANGED: return connectionStateChangedEvent(payload);
    case EVENT_CODE_CONNECTION_SYNC_STATE_CHANGED: return connectionEvent(ConnectionEventName.SyncStateChanged, SdkConnectionState.Ready, "sync_state_changed", payload);
    case EVENT_CODE_CONNECTION_SERVER_ERROR: return connectionEvent(ConnectionEventName.ServerError, SdkConnectionState.Connected, "server_error", payload);
    case EVENT_CODE_CONNECTION_KICKED_OFF: return connectionEvent(ConnectionEventName.KickedOff, SdkConnectionState.Disconnected, "kicked_off", payload);
    case EVENT_CODE_CONNECTION_TOKEN_EXPIRED: return connectionEvent(ConnectionEventName.TokenExpired, SdkConnectionState.Disconnected, "token_expired", payload);
    case EVENT_CODE_MESSAGE_RECEIVED: return messageReceivedEvent(payload);
    case EVENT_CODE_MESSAGE_RECEIVED_BATCH: return messageReceivedBatchEvent(payload);
    case EVENT_CODE_MESSAGE_SEND_ACK: return messageSendAckEvent(payload);
    case EVENT_CODE_MESSAGE_SEND_FAILED: return messageSendFailedEvent(payload);
    case EVENT_CODE_MESSAGE_RECALLED: return messageMutationEvent(MessageEventName.Recalled, "recalled", payload);
    case EVENT_CODE_MESSAGE_TYPING: return typingEvent(payload);
    case EVENT_CODE_MESSAGE_CAPABILITY: return contractEvent("message", "capability", payload);
    case EVENT_CODE_MESSAGE_EDITED: return messageMutationEvent(MessageEventName.Edited, "edited", payload);
    case EVENT_CODE_MESSAGE_REACTION_CHANGED: return reactionChangedEvent(payload);
    case EVENT_CODE_MESSAGE_DELETED: return messageMutationEvent(MessageEventName.Deleted, "deleted", payload);
    case EVENT_CODE_MESSAGE_READ_RECEIPT: return readReceiptEvent(payload);
    case EVENT_CODE_MESSAGE_RETENTION_SCHEDULED: return messageMutationEvent(MessageEventName.RetentionScheduled, "retention_scheduled", payload);
    case EVENT_CODE_MESSAGE_RETENTION_EXPIRED: return messageMutationEvent(MessageEventName.RetentionExpired, "retention_expired", payload);
    case EVENT_CODE_MESSAGE_RETENTION_PURGED: return messageMutationEvent(MessageEventName.RetentionPurged, "retention_purged", payload);
    case EVENT_CODE_MESSAGE_PINNED: return messageMutationEvent(MessageEventName.Pinned, "pinned", payload);
    case EVENT_CODE_MESSAGE_UNPINNED: return messageMutationEvent(MessageEventName.Unpinned, "unpinned", payload);
    case EVENT_CODE_MESSAGE_MARKED: return messageMutationEvent(MessageEventName.Marked, "marked", payload);
    case EVENT_CODE_MESSAGE_UNMARKED: return messageMutationEvent(MessageEventName.Unmarked, "unmarked", payload);
    case EVENT_CODE_MESSAGE_PRESENCE_CHANGED: return presenceChangedEvent(payload);
    case EVENT_CODE_MESSAGE_CUSTOM: return contractEvent("message", "custom", payload);
    case EVENT_CODE_MESSAGE_TYPING_AGGREGATE: return typingAggregateEvent(payload);
    case EVENT_CODE_CONVERSATION_SYNCED: return conversationEvent(ConversationEventName.Synced, "synced", payload);
    case EVENT_CODE_CONVERSATION_CREATED: return conversationEvent(ConversationEventName.Created, "created", payload);
    case EVENT_CODE_CONVERSATION_UPDATED: return conversationEvent(ConversationEventName.Updated, "updated", payload);
    case EVENT_CODE_CONVERSATION_UNREAD_COUNT_CHANGED: return conversationEvent(ConversationEventName.UnreadCountChanged, "unread_count_changed", payload);
    case EVENT_CODE_CONVERSATION_DELETED: return conversationEvent(ConversationEventName.Deleted, "deleted", payload);
    case EVENT_CODE_NOTIFICATION_RECEIVED: return notificationReceivedEvent(payload);
    case EVENT_CODE_SYNC_STARTED: return syncEvent(SyncEventName.Started, "started", payload);
    case EVENT_CODE_SYNC_FINISHED: return syncEvent(SyncEventName.Finished, "finished", payload);
    case EVENT_CODE_SYNC_FAILED: return syncEvent(SyncEventName.Failed, "failed", payload);
    case EVENT_CODE_SYNC_PROGRESS: return syncProgressEvent(payload);
    case EVENT_CODE_SYNC_TASK_COMPLETED: return syncEvent(SyncEventName.TaskCompleted, "task_completed", payload);
    case EVENT_CODE_SYNC_STATE_CHANGED: return syncEvent(SyncEventName.StateChanged, "state_changed", payload);
    case EVENT_CODE_SYNC_RESYNC_NEEDED: return syncEvent(SyncEventName.ResyncNeeded, "resync_needed", payload);
    case EVENT_CODE_SYNC_READINESS: return undefined;
    case EVENT_CODE_EXTENSION_EVENT: return capabilityEvent(payload);
    case EVENT_CODE_VIEW_UPDATED: return viewUpdatedEvent(payload);
    default: return {
      type: 'unknown',
      name: 'unknown',
      event: 'unknown',
      eventType,
      payload,
    };
  }
}

class DefaultEventSubscription implements EventSubscription {
  constructor(
    readonly id: string,
    private readonly onDispose: () => void,
    public handler?: unknown,
  ) {}

  unsubscribe(): void {
    this.onDispose();
  }
}

export class DefaultEventsApi implements EventsApi {
  private subscriptions: Map<number, DefaultEventSubscription> = new Map();
  private nextId = 1;

  constructor(private readonly bridge: NativeBridge) {}

  async subscribeEvents(request: SubscribeEventsRequest): Promise<Subscription> {
    return this.bridge.invoke<Subscription>(NativeCallMap.eventSubscribe, this.requestWithDefaultHandler(request));
  }

  async subscribeEventsBatch(request: SubscribeEventsRequest): Promise<Subscription> {
    return this.bridge.invoke<Subscription>(NativeCallMap.eventSubscribeBatch, this.requestWithDefaultHandler(request));
  }

  async unsubscribe(request: Record<string, unknown>): Promise<void> {
    await this.bridge.invoke<void>(NativeCallMap.eventUnsubscribe, request);
  }

  async unsubscribeAll(): Promise<void> {
    this.subscriptions.clear();
    await this.bridge.invoke<void>(NativeCallMap.eventUnsubscribeAll);
  }

  emit(event: unknown): void {
    const subscriptions = this.subscriptions;
    if (subscriptions.size === 0) {
      return;
    }
    // Fast path: a single subscription (the common case) needs no snapshot allocation.
    if (subscriptions.size === 1) {
      const handler = subscriptions.values().next().value?.handler;
      if (handler) {
        this.dispatchSafely(handler, event);
      }
      return;
    }
    // Snapshot so listeners added/removed during dispatch don't change this fan-out.
    for (const subscription of Array.from(subscriptions.values())) {
      if (subscription.handler) {
        this.dispatchSafely(subscription.handler, event);
      }
    }
  }

  private dispatchSafely(handler: unknown, event: unknown): void {
    try {
      if (typeof handler === 'function') {
        (handler as EventCallback<unknown>)(event);
      } else {
        this.dispatchToListener(handler as FlareImEventListener, event);
      }
    } catch (error) {
      console.error('[flare-core] event listener failed', error);
    }
  }

  addEventListener(listener: FlareImEventListener): EventSubscription {
    return this.register(listener);
  }

  removeEventListener(subscription: EventSubscription): void {
    subscription.unsubscribe();
  }

  emitNativeEvent(eventType: number, payload: unknown): void {
    this.emit(nativeEventFromCode(eventType, payload));
  }

  onInitializing(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.Initializing));
  }

  onInitialized(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.Initialized));
  }

  onInitFailed(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.InitFailed));
  }

  onLoginSucceeded(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.LoginSucceeded));
  }

  onLoginFailed(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.LoginFailed));
  }

  onLoggedOut(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.LoggedOut));
  }

  onDisposed(listener: EventCallback<LifecycleEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => lifecycleNameIs(event, LifecycleEventName.Disposed));
  }

  onConnecting(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.Connecting));
  }

  onConnectSuccess(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.Connected));
  }

  onConnectReady(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.Ready));
  }

  onConnectFailed(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.ServerError));
  }

  onDisconnected(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.Disconnected));
  }

  onReconnecting(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.Reconnecting));
  }

  onReconnectFailed(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.ReconnectFailed));
  }

  onKickedOffline(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.KickedOff));
  }

  onUserTokenExpired(listener: EventCallback<ConnectionEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'connection', ConnectionEventName.TokenExpired));
  }

  onMessageReceived(listener: EventCallback<MessageReceivedEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.Received));
  }

  onMessageReceivedBatch(listener: EventCallback<MessageReceivedBatchEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.ReceivedBatch));
  }

  onMessageSendAck(listener: EventCallback<MessageSendAckEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.SendAck));
  }

  onMessageSendFailed(listener: EventCallback<MessageSendFailedEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.SendFailed));
  }

  onMessageRecalled(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'message', MessageEventName.Recalled));
  }

  onMessageEdited(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'message', MessageEventName.Edited));
  }

  onMessageDeleted(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'message', MessageEventName.Deleted));
  }

  onMessageReadReceipt(listener: EventCallback<ReadReceiptEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.ReadReceipt));
  }

  onMessageReactionChanged(listener: EventCallback<ReactionChangedEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.ReactionChanged));
  }

  onInputStatusChanged(listener: EventCallback<TypingEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.Typing));
  }

  onTypingAggregateChanged(listener: EventCallback<TypingAggregateEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventEventIs(event, 'message', MessageEventName.TypingAggregate));
  }

  onMessageBurned(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'message', MessageEventName.Burned));
  }

  onMessagePinned(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'message', MessageEventName.Pinned));
  }

  onMessageUnpinned(listener: EventCallback<MessageMutationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'message', MessageEventName.Unpinned));
  }

  onViewUpdated(listener: EventCallback<ViewUpdate>): EventSubscription {
    return this.registerWhere(listener, (event) => eventTypeIs(event, 'view'));
  }

  onNewConversation(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'conversation', ConversationEventName.Created));
  }

  onConversationChanged(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventTypeIs(event, 'conversation'));
  }

  onTotalUnreadMessageCountChanged(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'conversation', ConversationEventName.UnreadCountChanged));
  }

  onConversationDeleted(listener: EventCallback<ConversationEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'conversation', ConversationEventName.Deleted));
  }

  onSyncServerStart(listener: EventCallback<SyncEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'sync', SyncEventName.Started));
  }

  onSyncServerFinish(listener: EventCallback<SyncEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'sync', SyncEventName.Finished));
  }

  onSyncServerFailed(listener: EventCallback<SyncEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'sync', SyncEventName.Failed));
  }

  onSyncProgress(listener: EventCallback<SdkProgressEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'sync', ProgressEventName.SyncProgress));
  }

  onUploadProgress(listener: EventCallback<SdkProgressEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'progress', ProgressEventName.UploadProgress));
  }

  onDownloadProgress(listener: EventCallback<SdkProgressEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventNameIs(event, 'progress', ProgressEventName.DownloadProgress));
  }

  onCapabilityChanged(listener: EventCallback<CapabilityEvent>): EventSubscription {
    return this.registerWhere(listener, (event) => eventTypeIs(event, 'capability'));
  }

  private requestWithDefaultHandler(request: SubscribeEventsRequest): SubscribeEventsRequest {
    const record = request as Record<string, unknown>;
    if (record.handler !== undefined) {
      return request;
    }
    return {
      ...record,
      handler: (eventType: number, payload: unknown) => this.emitNativeEvent(eventType, payload),
    } as SubscribeEventsRequest;
  }

  private register(handler: unknown): EventSubscription {
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
    return this.register((event: unknown) => {
      listener(event as T);
    });
  }

  private registerWhere<T>(
    listener: EventCallback<T>,
    predicate: (event: unknown) => boolean,
  ): EventSubscription {
    return this.register((event: unknown) => {
      if (predicate(event)) {
        listener(event as T);
      }
    });
  }

  private dispatchToListener(listener: FlareImEventListener, event: unknown): void {
    const record = event && typeof event === 'object'
      ? event as { type?: unknown; event?: unknown; name?: unknown; state?: unknown }
      : {};
    const type = String(record.type ?? '');
    const eventName = String(record.event ?? '');
    const name = String(record.name ?? '');
    if (type === 'message') {
      switch (eventName) {
        case MessageEventName.Received:
          listener.onMessageReceived?.(event as MessageReceivedEvent);
          return;
        case MessageEventName.ReceivedBatch:
          listener.onMessageReceivedBatch?.(event as MessageReceivedBatchEvent);
          return;
        case MessageEventName.SendAck:
          listener.onMessageSendAck?.(event as MessageSendAckEvent);
          return;
        case MessageEventName.SendFailed:
          listener.onMessageSendFailed?.(event as MessageSendFailedEvent);
          return;
        case MessageEventName.Recalled:
          listener.onMessageRecalled?.(event as MessageMutationEvent);
          return;
        case MessageEventName.Edited:
          listener.onMessageEdited?.(event as MessageMutationEvent);
          return;
        case MessageEventName.Deleted:
          listener.onMessageDeleted?.(event as MessageMutationEvent);
          return;
        case MessageEventName.ReadReceipt:
          listener.onMessageReadReceipt?.(event as ReadReceiptEvent);
          return;
        case MessageEventName.ReactionChanged:
          listener.onMessageReactionChanged?.(event as ReactionChangedEvent);
          return;
        case MessageEventName.Typing:
          listener.onInputStatusChanged?.(event as TypingEvent);
          return;
        case MessageEventName.Burned:
        case MessageEventName.RetentionExpired:
        case MessageEventName.RetentionPurged:
          listener.onMessageBurned?.(event as MessageMutationEvent);
          return;
        case MessageEventName.Pinned:
          listener.onMessagePinned?.(event as MessageMutationEvent);
          return;
        case MessageEventName.Unpinned:
          listener.onMessageUnpinned?.(event as MessageMutationEvent);
          return;
        default:
          return;
      }
    }
    if (type === 'conversation') {
      switch (name) {
        case ConversationEventName.Created:
          listener.onNewConversation?.(event as ConversationEvent);
          return;
        case ConversationEventName.Deleted:
          listener.onConversationDeleted?.(event as ConversationEvent);
          return;
        case ConversationEventName.UnreadCountChanged:
          listener.onTotalUnreadMessageCountChanged?.(event as ConversationEvent);
          return;
        default:
          listener.onConversationChanged?.(event as ConversationEvent);
          return;
      }
    }
    if (type === 'sync') {
      if (name === ProgressEventName.SyncProgress) {
        listener.onSyncProgress?.(event as SdkProgressEvent);
        return;
      }
      switch (name) {
        case SyncEventName.Started:
          listener.onSyncServerStart?.(event as SyncEvent);
          return;
        case SyncEventName.Finished:
          listener.onSyncServerFinish?.(event as SyncEvent);
          return;
        case SyncEventName.Failed:
          listener.onSyncServerFailed?.(event as SyncEvent);
          return;
        default:
          return;
      }
    }
    if (type === 'connection') {
      switch (name) {
        case ConnectionEventName.Connecting:
          listener.onConnecting?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.Connected:
          listener.onConnectSuccess?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.Ready:
          listener.onConnectReady?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.Disconnected:
          listener.onDisconnected?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.Reconnecting:
          listener.onReconnecting?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.ReconnectFailed:
          listener.onReconnectFailed?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.KickedOff:
          listener.onKickedOffline?.(event as ConnectionEvent);
          return;
        case ConnectionEventName.TokenExpired:
          listener.onUserTokenExpired?.(event as ConnectionEvent);
          return;
        default:
          return;
      }
    }
    if (type === 'view') {
      listener.onViewUpdated?.(event as ViewUpdate);
      return;
    }
    if (type === 'capability') {
      listener.onCapabilityChanged?.(event as CapabilityEvent);
      return;
    }
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
  }
}
