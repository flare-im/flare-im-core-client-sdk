// GENERATED. Do not edit by hand.
import { SdkErrorPayload } from '../../common/error/sdk_error_payload';

/** Message send failure notification. */
export interface MessageSendFailedEvent {
  /** wire: `clientMsgId`. Client message id that failed. */
  clientMsgId: string;
  /** wire: `reason`. Failure reason text for people; use error.code and error.machineReason to act on it. */
  reason: string;
  /** wire: `error`. Structured failure: code, machineReason (ErrorDetail.reason when the server rejected), message, operation, retryable, details. */
  error?: SdkErrorPayload;
}
