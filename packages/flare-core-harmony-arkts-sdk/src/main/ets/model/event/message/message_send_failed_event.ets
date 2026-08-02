// GENERATED. Do not edit by hand.
import { SdkErrorPayload } from '../../common/error/sdk_error_payload';

/** Message send failure notification. */
export interface MessageSendFailedEvent {
  /** wire: `clientMsgId`. Client message id that failed. */
  clientMsgId: string;
  /** wire: `reason`. Failure reason. */
  reason: string;
  /** wire: `error`. Structured failure details when available. */
  error?: SdkErrorPayload;
}
