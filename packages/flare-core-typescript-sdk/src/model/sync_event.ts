/** GENERATED. Do not edit by hand. */
import type { SdkErrorPayload } from './sdk_error_payload';
import type { SyncEventName } from './sync_event_name';

/** Sync orchestration notification payload. */
export interface SyncEvent {
  /** wire: `name`. Sync event name. */
  name: SyncEventName;
  /** wire: `runId`. Stable sync run id used to correlate readiness, progress, and completion. */
  runId?: string;
  /** wire: `trigger`. Sync trigger. */
  trigger?: string;
  /** wire: `scope`. Sync scope. */
  scope?: string;
  /** wire: `visibility`. Sync visibility policy. */
  visibility?: string;
  /** wire: `reason`. Sync reason for diagnostics and startup wait reports. */
  reason?: string;
  /** wire: `phase`. Sync phase. */
  phase?: string;
  /** wire: `task`. Sync task name. */
  task?: string;
  /** wire: `stage`. Readiness stage for sync.readiness events. */
  stage?: string;
  /** wire: `progress`. Progress percentage from 0 to 100. */
  progress?: number;
  /** wire: `error`. Failure details for failed sync events. */
  error?: SdkErrorPayload;
}
