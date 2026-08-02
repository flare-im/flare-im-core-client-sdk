// GENERATED. Do not edit by hand.
import { ConversationVersion } from '../entity/conversation_version';

/** Conversations whose local version is missing or newer than the caller's snapshot. */
export interface SyncConversationSummariesResponse {
  /** wire: `changedConversations`.  */
  changedConversations: Array<ConversationVersion>;
}
