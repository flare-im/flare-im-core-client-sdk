/** GENERATED. Do not edit by hand. */

/** Build a thread reply message. */
export interface BuildThreadReplyMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `threadId`. Thread root message id. */
  threadId: string;
  /** wire: `text`. Reply text. */
  text: string;
}
