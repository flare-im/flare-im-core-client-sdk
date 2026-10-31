// GENERATED. Do not edit by hand.
import { ViewDelta } from './view_delta';
import { ViewSnapshot } from './view_snapshot';

/** Observable view update event payload (view.updated). Every update a view publishes carries the next revision; a host that sees a revision that is not its applied revision plus 1 drops it when it is not newer, otherwise replaces its window with timelineSnapshot. */
export interface ViewUpdate {
  /** wire: `viewId`. Updated view id. */
  viewId: string;
  /** wire: `revision`. Revision this update brings the view to. */
  revision: number;
  /** wire: `kind`. Update kind: snapshot or delta. */
  kind: string;
  /** wire: `snapshot`. Whole view when kind is snapshot. */
  snapshot?: ViewSnapshot;
  /** wire: `delta`. View delta when kind is delta. */
  delta?: ViewDelta;
}
