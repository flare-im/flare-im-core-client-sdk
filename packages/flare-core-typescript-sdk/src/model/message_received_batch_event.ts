/** GENERATED. Do not edit by hand. */
import type { Message } from './message';

/** Batch message received notification. */
export interface MessageReceivedBatchEvent {
  /** wire: `messages`. Received messages. */
  messages: Message[];
}
