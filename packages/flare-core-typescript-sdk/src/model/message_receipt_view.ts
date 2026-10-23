/** GENERATED. Do not edit by hand. */
import type { MessageReadSummary } from './message_read_summary';
import type { MessageReceiptStatus } from './message_receipt_status';

/** The receipt projection of a message, computed by the core SDK; kits draw it as is (no host mapping from status, isRead or localState). Incoming messages carry one too, kits show no receipt for them. */
export interface MessageReceiptView {
  /** wire: `status`. Receipt state. */
  status: MessageReceiptStatus;
  /** wire: `readSummary`. Only on the viewer's own messages in groups, once the core SDK has read it from Core for a message a view shows (and refreshed on read receipts); absent in single chats, in groups above the large-group threshold, and before it is known. Never a made-up number. */
  readSummary?: MessageReadSummary;
}
