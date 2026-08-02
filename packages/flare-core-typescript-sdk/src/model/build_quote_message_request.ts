/** GENERATED. Do not edit by hand. */
import type { MessageContent } from './message_content';

/** Build a quote/reply message. */
export interface BuildQuoteMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `quotedMessageId`. Quoted message id. */
  quotedMessageId: string;
  /** wire: `text`. Reply text. */
  text: string;
  /** wire: `quotedSenderId`. Quoted sender id. */
  quotedSenderId?: string;
  /** wire: `quotedTextPreview`. Quoted preview text. */
  quotedTextPreview?: string;
  /** wire: `quotedContent`. Quoted message content element. */
  quotedContent: MessageContent;
}
