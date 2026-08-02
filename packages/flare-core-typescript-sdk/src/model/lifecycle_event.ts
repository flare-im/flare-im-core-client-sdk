/** GENERATED. Do not edit by hand. */
import type { LifecycleEventName } from './lifecycle_event_name';
import type { SdkErrorPayload } from './sdk_error_payload';

/** Lifecycle notification. Method return values remain the primary success/failure contract. */
export interface LifecycleEvent {
  /** wire: `name`. Lifecycle event name. */
  name: LifecycleEventName;
  /** wire: `operation`. Operation associated with this lifecycle event. */
  operation: string;
  /** wire: `userId`. Current user id when known. */
  userId?: string;
  /** wire: `sessionId`. SDK session id when available. */
  sessionId?: string;
  /** wire: `error`. Failure details for *_failed events. */
  error?: SdkErrorPayload;
}
