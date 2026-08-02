/** GENERATED. Do not edit by hand. */
import type { ViewSnapshot } from './view_snapshot';

/** Response returned when opening an observable view. */
export interface ViewOpenResponse {
  /** wire: `viewId`. Opened view id. */
  viewId: string;
  /** wire: `snapshot`. Initial snapshot for this view. */
  snapshot: ViewSnapshot;
}
