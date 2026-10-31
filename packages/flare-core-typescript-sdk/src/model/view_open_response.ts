/** GENERATED. Do not edit by hand. */
import type { ViewSnapshot } from './view_snapshot';

/** Response returned when opening an observable view and by timelineSnapshot. */
export interface ViewOpenResponse {
  /** wire: `viewId`. View id. */
  viewId: string;
  /** wire: `revision`. Revision of this snapshot; every later view.updated event for the view carries the next revision. */
  revision: number;
  /** wire: `snapshot`. Snapshot of the view at that revision. */
  snapshot: ViewSnapshot;
}
