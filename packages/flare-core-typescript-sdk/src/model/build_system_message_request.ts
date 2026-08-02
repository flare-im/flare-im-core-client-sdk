/** GENERATED. Do not edit by hand. */

/** Build a system message. */
export interface BuildSystemMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `eventKind`. System event kind. */
  eventKind: string;
  /** wire: `body`. System event body. */
  body: string;
}
