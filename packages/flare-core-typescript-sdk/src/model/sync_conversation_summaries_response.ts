/** GENERATED. Do not edit by hand. */
import type { ConversationVersion } from './conversation_version';

/** Conversations whose local version is missing or newer than the caller's snapshot. */
export interface SyncConversationSummariesResponse {
  /** wire: `changedConversations`.  */
  changedConversations: ConversationVersion[];
}
