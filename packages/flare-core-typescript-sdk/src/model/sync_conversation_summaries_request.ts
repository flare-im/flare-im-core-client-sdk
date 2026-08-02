/** GENERATED. Do not edit by hand. */
import type { ConversationVersion } from './conversation_version';

/** Request for summary sync with client-known conversation versions. */
export interface SyncConversationSummariesRequest {
  /** wire: `knownVersions`.  */
  knownVersions: ConversationVersion[];
}
