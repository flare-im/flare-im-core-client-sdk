/** GENERATED. Do not edit by hand. */
import type { SdkErrorPayload } from './sdk_error_payload';

/** Message send failure notification. */
export interface MessageSendFailedEvent {
  /** wire: `clientMsgId`. Client message id that failed. */
  clientMsgId: string;
  /** wire: `reason`. Failure reason. */
  reason: string;
  /** wire: `error`. Structured failure details when available. */
  error?: SdkErrorPayload;
}
