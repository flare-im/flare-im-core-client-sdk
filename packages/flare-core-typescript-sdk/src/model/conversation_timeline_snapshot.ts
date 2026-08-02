/** GENERATED. Do not edit by hand. */
import type { Conversation } from './conversation';
import type { Message } from './message';

/** ConversationTimelineSnapshot */
export interface ConversationTimelineSnapshot {
  /** wire: `conversation`.  */
  conversation?: Conversation;
  /** wire: `hasMore`.  */
  hasMore: boolean;
  /** wire: `messages`.  */
  messages: Message[];
}
