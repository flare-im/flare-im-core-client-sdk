/** GENERATED. Do not edit by hand. */
import type { ViewDelta } from './view_delta';
import type { ViewSnapshot } from './view_snapshot';

/** Observable view update event payload. */
export interface ViewUpdate {
  /** wire: `viewId`. Updated view id. */
  viewId: string;
  /** wire: `kind`. Update kind: snapshot or delta. */
  kind: string;
  /** wire: `snapshot`. Latest snapshot for this view when kind is snapshot. */
  snapshot?: ViewSnapshot;
  /** wire: `delta`. View delta when kind is delta. */
  delta?: ViewDelta;
}
