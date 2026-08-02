/** GENERATED. Do not edit by hand. */
export * from './common';
export * from './capability';
export * from './connection';
export * from './conversation';
export * from './lifecycle';
export * from './media';
export * from './message';
export * from './sync';
export * from './view';

import type { CapabilityEventListener } from './capability';
import type { ConnectionEventListener } from './connection';
import type { ConversationEventListener } from './conversation';
import type { LifecycleEventListener } from './lifecycle';
import type { MediaEventListener } from './media';
import type { MessageEventListener } from './message';
import type { SyncEventListener } from './sync';
import type { ViewEventListener } from './view';

/** Optional callback surface for apps that prefer one listener object. */
export interface FlareImEventListener extends CapabilityEventListener, ConnectionEventListener, ConversationEventListener, LifecycleEventListener, MediaEventListener, MessageEventListener, SyncEventListener, ViewEventListener {}
