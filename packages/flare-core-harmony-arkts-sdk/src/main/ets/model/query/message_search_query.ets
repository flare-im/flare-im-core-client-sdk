// GENERATED. Do not edit by hand.
import { MessageSearchKind } from '../common/enums/message_search_kind';

/** MessageSearchQuery */
export interface MessageSearchQuery {
  /** wire: `conversationId`.  */
  conversationId?: string;
  /** wire: `fromTime`. 起始消息时间（毫秒，含）。 */
  fromTime?: number;
  /** wire: `includeRecalled`. 默认排除已撤回消息。 */
  includeRecalled: boolean;
  /** wire: `keyword`.  */
  keyword?: string;
  /** wire: `kinds`.  */
  kinds: Array<MessageSearchKind>;
  /** wire: `limit`.  */
  limit: number;
  /** wire: `senderId`.  */
  senderId?: string;
  /** wire: `toTime`. 截止消息时间（毫秒，含）。 */
  toTime?: number;
}
