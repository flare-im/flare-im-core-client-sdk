// GENERATED. Do not edit by hand.

/** Build a text message. */
export interface BuildTextMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `text`. Text body. */
  text: string;
  /** wire: `mentionUsers`. User ids mentioned in the text body. The core builder resolves @userId spans into typed mentions. */
  mentionUsers?: Array<string>;
  /** wire: `mentionAll`. Whether the message mentions every member in the target conversation. */
  mentionAll?: boolean;
}
