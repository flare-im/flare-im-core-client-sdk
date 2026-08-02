/** GENERATED. Do not edit by hand. */
import type { ForwardSourceMessage } from './forward_source_message';

/** Forward message payload. */
export interface ForwardContentPayload {
  /** wire: `merge`. Merge forwarded messages into one card. */
  merge?: boolean;
  /** wire: `title`. Forward title. */
  title?: string;
  /** wire: `sourceMessages`. Forwarded sources. */
  sourceMessages: ForwardSourceMessage[];
}
