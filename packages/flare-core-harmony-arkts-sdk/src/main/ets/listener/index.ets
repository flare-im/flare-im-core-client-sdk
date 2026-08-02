// GENERATED. Do not edit by hand.
export * from './common';
export * from './capability';
export * from './connection';
export * from './conversation';
export * from './lifecycle';
export * from './media';
export * from './message';
export * from './sync';
export * from './view';

import { CapabilityEventListener } from './capability';
import { ConnectionEventListener } from './connection';
import { ConversationEventListener } from './conversation';
import { LifecycleEventListener } from './lifecycle';
import { MediaEventListener } from './media';
import { MessageEventListener } from './message';
import { SyncEventListener } from './sync';
import { ViewEventListener } from './view';

/** Optional callback surface for apps that prefer one listener object. */
export interface FlareImEventListener extends CapabilityEventListener, ConnectionEventListener, ConversationEventListener, LifecycleEventListener, MediaEventListener, MessageEventListener, SyncEventListener, ViewEventListener {}
