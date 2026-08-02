// GENERATED. Do not edit by hand.
import { Message } from '../../entity/message';

/** Batch message received notification. */
export interface MessageReceivedBatchEvent {
  /** wire: `messages`. Received messages. */
  messages: Array<Message>;
}
