/** GENERATED. Do not edit by hand. */
import type { MessageEventName } from './message_event_name';

/** Message mutation notification for recall, edit, delete, pin, mark and burn events. */
export interface MessageMutationEvent {
  /** wire: `name`. Mutation event name. */
  name: MessageEventName;
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `messageId`. Client or server message id. */
  messageId?: string;
  /** wire: `serverMsgId`. Server message id. */
  serverMsgId?: string;
  /** wire: `userId`. User associated with the mutation. */
  userId?: string;
  /** wire: `reason`. Mutation reason when available. */
  reason?: string;
}
