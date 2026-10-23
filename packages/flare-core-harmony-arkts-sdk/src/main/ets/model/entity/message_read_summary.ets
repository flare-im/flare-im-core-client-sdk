// GENERATED. Do not edit by hand.

/** Who read one of the viewer's own messages in a group, the sender excluded: total = readCount + unreadCount, always above 0. */
export interface MessageReadSummary {
  /** wire: `readCount`. Members who read the message. */
  readCount: number;
  /** wire: `unreadCount`. Members who have not read it yet. */
  unreadCount: number;
  /** wire: `total`. Members the message counts, the sender excluded. */
  total: number;
}
