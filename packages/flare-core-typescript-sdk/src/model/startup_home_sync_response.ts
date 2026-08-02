/** GENERATED. Do not edit by hand. */
import type { HomeTimelineSnapshot } from './home_timeline_snapshot';

/** First usable home snapshot plus diagnostics about the startup sync path. */
export interface StartupHomeSyncResponse {
  /** wire: `backgroundConvergenceStarted`.  */
  backgroundConvergenceStarted: boolean;
  /** wire: `coldSyncPerformed`.  */
  coldSyncPerformed: boolean;
  /** wire: `degradedReason`.  */
  degradedReason?: string;
  /** wire: `servedFromLocal`.  */
  servedFromLocal: boolean;
  /** wire: `snapshot`.  */
  snapshot: HomeTimelineSnapshot;
}
