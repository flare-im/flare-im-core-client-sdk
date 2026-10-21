/** GENERATED. Do not edit by hand. */

/** Generic safe plugin message over the existing AppCard envelope. */
export interface BuildPluginMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `payload`. Validated generic plugin message envelope defined by flare-plugin-protocol. */
  payload: Record<string, unknown>;
}
