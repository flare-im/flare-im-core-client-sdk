/** GENERATED. Do not edit by hand. */

/** Build a schedule message. */
export interface BuildScheduleMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `scheduleId`. Schedule id. */
  scheduleId: string;
  /** wire: `title`. Schedule title. */
  title: string;
  /** wire: `startTimeMs`. Start time in milliseconds since epoch. */
  startTimeMs: number;
  /** wire: `endTimeMs`. End time in milliseconds since epoch. */
  endTimeMs: number;
  /** wire: `participantUserIds`. Schedule participants. */
  participantUserIds: string[];
}
