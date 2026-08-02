/** GENERATED. Do not edit by hand. */
import type { MessageBuildOp } from './message_build_op';

/** Generic typed build request used by composer helpers. */
export interface BuildTypedMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `op`. Build operation. */
  op: MessageBuildOp;
  /** wire: `data`. Operation-specific payload; prefer typed buildXxx requests. */
  data?: Record<string, unknown>;
}
