// GENERATED. Do not edit by hand.
import { MessageContent } from '../../../entity/message_content';

/** Build from an existing MessageContent envelope. */
export interface BuildWithContentMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `content`. Decoded content envelope. */
  content: MessageContent;
}
