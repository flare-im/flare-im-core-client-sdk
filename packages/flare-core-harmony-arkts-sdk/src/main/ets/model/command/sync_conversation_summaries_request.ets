// GENERATED. Do not edit by hand.
import { ConversationVersion } from '../entity/conversation_version';

/** Request for summary sync with client-known conversation versions. */
export interface SyncConversationSummariesRequest {
  /** wire: `knownVersions`.  */
  knownVersions: Array<ConversationVersion>;
}
