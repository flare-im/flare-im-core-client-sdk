// GENERATED. Do not edit by hand.
import { Conversation } from './conversation';
import { Message } from './message';

/** The window of a timeline view: rows in timeline order and where it stands. */
export interface TimelineViewSnapshot {
  /** wire: `conversation`. Conversation header. */
  conversation?: Conversation;
  /** wire: `messages`. Rows in timeline order (oldest first); pending rows trail when the window is attached to the latest. */
  messages: Array<Message>;
  /** wire: `hasOlder`. More visible messages exist below the oldest row; answered by the proven seq ranges only. */
  hasOlder: boolean;
  /** wire: `hasNewer`. More messages exist above the newest row; true exactly when attachedToLatest is false. */
  hasNewer: boolean;
  /** wire: `attachedToLatest`. The newest row is the latest local message and live messages are appended. */
  attachedToLatest: boolean;
  /** wire: `anchorKey`. Row key of the target when the view was opened around a message. */
  anchorKey?: string;
}
