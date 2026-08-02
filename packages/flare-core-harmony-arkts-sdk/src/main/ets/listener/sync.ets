// GENERATED. Do not edit by hand.
import { ProgressEvent, SyncEvent } from '../model';

/** Sync listener callbacks. */
export interface SyncEventListener {
  /** Server conversation or message sync started. */
  onSyncServerStart?(event: SyncEvent): void;
  /** Server conversation or message sync finished. */
  onSyncServerFinish?(event: SyncEvent): void;
  /** Server conversation or message sync failed. */
  onSyncServerFailed?(event: SyncEvent): void;
  /** Server sync progress changed. */
  onSyncProgress?(event: ProgressEvent): void;
}
