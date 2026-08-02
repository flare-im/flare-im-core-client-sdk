/** GENERATED. Do not edit by hand. */

/** Build a task message. */
export interface BuildTaskMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `taskId`. Task id. */
  taskId: string;
  /** wire: `title`. Task title. */
  title: string;
  /** wire: `status`. Task status. */
  status?: string;
  /** wire: `participantUserIds`. Task participants. */
  participantUserIds: string[];
}
