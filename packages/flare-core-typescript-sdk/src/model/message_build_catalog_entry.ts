/** GENERATED. Do not edit by hand. */
import type { MessageBuildOp } from './message_build_op';
import type { MessageContentType } from './message_content_type';

/** One supported quick-build operation exposed on MessageBuilderApi. */
export interface MessageBuildCatalogEntry {
  /** wire: `op`. Build dispatch op. */
  op: MessageBuildOp;
  /** wire: `method`. Facade method name, e.g. buildText. */
  method: string;
  /** wire: `requestType`. Typed request model name. */
  requestType: string;
  /** wire: `contentType`. Decoded content discriminator. */
  contentType: MessageContentType;
  /** wire: `messageType`. Core message type integer. */
  messageType: number;
  /** wire: `summary`. Human-readable summary for UI/docs. */
  summary: string;
  /** wire: `stability`. stable | beta | experimental */
  stability: string;
}
