/** GENERATED. Do not edit by hand. */
import type { ConnectionEventName } from './connection_event_name';
import type { SdkConnectionState } from './sdk_connection_state';
import type { SdkErrorPayload } from './sdk_error_payload';

/** Connection notification payload. */
export interface ConnectionEvent {
  /** wire: `name`. Connection event name. */
  name: ConnectionEventName;
  /** wire: `state`. Connection state after this event. */
  state: SdkConnectionState;
  /** wire: `reason`. Disconnect, kicked-off, or token-expired reason. */
  reason?: string;
  /** wire: `attempt`. Reconnect attempt number. */
  attempt?: number;
  /** wire: `error`. Server or reconnect failure details. */
  error?: SdkErrorPayload;
}
