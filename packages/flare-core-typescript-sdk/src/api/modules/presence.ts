/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `presence` — Presence and input state.
 */
import type { BatchGetUserPresenceRequest, BatchGetUserPresenceResponse, GetUserPresenceRequest, SubscribeUserPresenceRequest, UserPresence } from '../types';

/** Presence and input state. */
export interface PresenceApi {
  /** getUserPresence maps to `flare_sdk_get_user_presence` via `ffi-symbol`. Operation: `presence.get`. */
  getUserPresence(request: GetUserPresenceRequest): Promise<UserPresence>;
  /** batchGetUserPresence maps to `flare_sdk_batch_get_user_presence` via `ffi-symbol`. Operation: `presence.batch_get`. */
  batchGetUserPresence(request: BatchGetUserPresenceRequest): Promise<BatchGetUserPresenceResponse>;
  /** subscribeUserPresence maps to `flare_sdk_subscribe_user_presence` via `ffi-symbol`. Operation: `presence.subscribe`. */
  subscribeUserPresence(request: SubscribeUserPresenceRequest): Promise<void>;
}
