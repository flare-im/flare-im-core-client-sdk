/** GENERATED. Do not edit by hand. */

/** Aggregated typing/input-state notification for large conversations. */
export interface TypingAggregateEvent {
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `typingUserIds`. Users currently typing in the aggregation window. */
  typingUserIds: string[];
  /** wire: `typingCount`. Number of users currently typing in the aggregation window. */
  typingCount: number;
}
