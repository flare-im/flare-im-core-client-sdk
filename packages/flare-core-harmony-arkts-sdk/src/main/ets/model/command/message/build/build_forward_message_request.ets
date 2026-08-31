// GENERATED. Do not edit by hand.
import { Message } from '../../../entity/message';

/** Build a forward message. */
export interface BuildForwardMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `merge`. Merge into one card. */
  merge?: boolean;
  /** wire: `title`. Forward title. */
  title: string;
  /** wire: `sourceMessages`. Messages to forward. Full messages, not id stubs: the forward payload embeds the original content, so the core needs content/senderId/conversationId of each source. */
  sourceMessages: Array<Message>;
}
