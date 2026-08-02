// GENERATED. Do not edit by hand.
import { ViewUpdate } from '../entity/view_update';

/** Response returned after extending an observable timeline view. */
export interface ViewLoadOlderResponse {
  /** wire: `viewId`. Updated timeline view id. */
  viewId: string;
  /** wire: `loadedCount`. Number of older messages inserted into the view window. */
  loadedCount: number;
  /** wire: `hasMore`. Whether older messages may still be available. */
  hasMore: boolean;
  /** wire: `update`. Delta or snapshot that applies this page to the view. */
  update?: ViewUpdate;
}
