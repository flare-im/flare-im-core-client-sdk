/** GENERATED. Do not edit by hand. */

/** Typed request for updating the current user's synced conversation draft. */
export interface UpdateConversationDraftRequest {
  /** wire: `conversationId`. Conversation id whose draft is being updated. */
  conversationId: string;
  /** wire: `draft`. Draft text. Omit or set null to clear the draft. */
  draft?: string;
}
