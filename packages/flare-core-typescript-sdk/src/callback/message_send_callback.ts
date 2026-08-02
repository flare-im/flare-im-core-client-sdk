/** GENERATED. Do not edit by hand. */
import type { MessageSendAckEvent, MessageSendFailedEvent, ProgressEvent } from '../model';

/** Direct callback for `messages.sendMessage(request, callback)` progress and terminal states. */
export interface MessageSendCallback {
  /** Message upload or send progress changed. */
  onProgress?(event: ProgressEvent): void;
  /** Message send completed successfully. */
  onSuccess?(event: MessageSendAckEvent): void;
  /** Message send failed. */
  onFailure?(event: MessageSendFailedEvent): void;
}
