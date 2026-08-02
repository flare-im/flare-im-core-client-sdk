/** GENERATED. Do not edit by hand. */
import type { MessageContentType } from './message_content_type';

/** Decoded content envelope. Type-specific payload lives in `data` until per-content models are generated. */
export interface MessageContent {
  /** wire: `contentType`. Content discriminator. */
  contentType: MessageContentType;
  /** wire: `data`. Content payload object. */
  data: Record<string, unknown>;
}
