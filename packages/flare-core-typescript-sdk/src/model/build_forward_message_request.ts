/** GENERATED. Do not edit by hand. */
import type { ForwardSourceMessage } from './forward_source_message';

/** Build a forward message. */
export interface BuildForwardMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `merge`. Merge into one card. */
  merge?: boolean;
  /** wire: `title`. Forward title. */
  title: string;
  /** wire: `sourceMessages`. Messages to forward. */
  sourceMessages: ForwardSourceMessage[];
}
