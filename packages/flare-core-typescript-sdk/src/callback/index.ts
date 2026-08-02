/**
 * GENERATED. Do not edit by hand.
 *
 * Callback styles exported by the TypeScript API package:
 *
 * | Style | Type | Use when |
 * |-------|------|----------|
 * | Event callback | `EventCallback<T>` | Single `client.events.on*(handler)` |
 * | Subscription | `EventSubscription` | Dispose one registration (`unsubscribe()`) |
 * | Listener object | `FlareImEventListener` | One object with optional `on*` methods |
 * | Operation callback | `MessageSendCallback` | `messages.sendMessage(req, cb)` progress/result |
 * | Native bus | `NativeEventSubscription` | FFI `event.subscribe` handle |
 */
export type { EventCallback, EventSubscription, ListenerHandler, NativeEventSubscription } from '../listener/common';
export type { MessageSendCallback } from './message_send_callback';
export type { FlareImEventListener } from '../listener';
export type { CapabilityEventListener } from '../listener/capability';
export type { ConnectionEventListener } from '../listener/connection';
export type { ConversationEventListener } from '../listener/conversation';
export type { LifecycleEventListener } from '../listener/lifecycle';
export type { MediaEventListener } from '../listener/media';
export type { MessageEventListener } from '../listener/message';
export type { SyncEventListener } from '../listener/sync';
