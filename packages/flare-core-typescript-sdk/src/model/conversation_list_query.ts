/** GENERATED. Do not edit by hand. */
import type { ConversationType } from './conversation_type';

/** ConversationListQuery */
export interface ConversationListQuery {
  /** wire: `conversationTypes`.  */
  conversationTypes: ConversationType[];
  /** wire: `cursor`. cursor 为会话 ID，表示从该会话之后开始。 */
  cursor?: string;
  /** wire: `hasDraftOnly`.  */
  hasDraftOnly: boolean;
  /** wire: `hasMarkedMessages`. 标记消息所在会话。core 当前没有“会话标签”模型，因此只支持消息标记聚合。 */
  hasMarkedMessages: boolean;
  /** wire: `includeArchived`.  */
  includeArchived: boolean;
  /** wire: `keyword`.  */
  keyword?: string;
  /** wire: `limit`.  */
  limit?: number;
  /** wire: `mentionMeOnly`.  */
  mentionMeOnly: boolean;
  /** wire: `mutedOnly`.  */
  mutedOnly?: boolean;
  /** wire: `pinnedOnly`.  */
  pinnedOnly: boolean;
  /** wire: `unreadOnly`.  */
  unreadOnly: boolean;
}
