// GENERATED. Do not edit by hand.
import { Message } from '../../entity/message';

/** Send a fully built message. */
export interface SendMessageRequest {
  /** wire: `message`. Message to send. */
  message: Message;
  /** wire: `expectedUserId`. Optional active-user precondition; cannot override the authenticated sender. */
  expectedUserId?: string;
}
