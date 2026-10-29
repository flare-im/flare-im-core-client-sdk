// GENERATED. Do not edit by hand.
export * from './common';
export * from './connection';
export * from './conversation';
export * from './lifecycle';
export * from './media';
export * from './message';
export * from './plugin';
export * from './sync';
export * from './view';

import { ConnectionEventListener } from './connection';
import { ConversationEventListener } from './conversation';
import { LifecycleEventListener } from './lifecycle';
import { MediaEventListener } from './media';
import { MessageEventListener } from './message';
import { PluginEventListener } from './plugin';
import { SyncEventListener } from './sync';
import { ViewEventListener } from './view';

/** Optional callback surface for apps that prefer one listener object. */
export interface FlareImEventListener extends ConnectionEventListener, ConversationEventListener, LifecycleEventListener, MediaEventListener, MessageEventListener, PluginEventListener, SyncEventListener, ViewEventListener {}
