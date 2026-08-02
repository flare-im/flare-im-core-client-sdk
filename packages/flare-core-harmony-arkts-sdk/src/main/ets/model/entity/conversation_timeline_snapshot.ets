// GENERATED. Do not edit by hand.
import { Conversation } from './conversation';
import { Message } from './message';

/** ConversationTimelineSnapshot */
export interface ConversationTimelineSnapshot {
  /** wire: `conversation`.  */
  conversation?: Conversation;
  /** wire: `hasMore`.  */
  hasMore: boolean;
  /** wire: `messages`.  */
  messages: Array<Message>;
}
