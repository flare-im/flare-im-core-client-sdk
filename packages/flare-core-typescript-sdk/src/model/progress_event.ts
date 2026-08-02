/** GENERATED. Do not edit by hand. */
import type { ProgressEventName } from './progress_event_name';

/** Generic sync, upload or download progress notification. */
export interface ProgressEvent {
  /** wire: `name`. Progress event name. */
  name: ProgressEventName;
  /** wire: `operation`. Operation being tracked. */
  operation: string;
  /** wire: `current`. Current progress units. */
  current: number;
  /** wire: `total`. Total progress units. */
  total: number;
  /** wire: `taskId`. Task identifier when available. */
  taskId?: string;
  /** wire: `detail`. Human-readable progress detail. */
  detail?: string;
}
