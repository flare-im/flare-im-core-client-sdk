/** GENERATED. Do not edit by hand. */

/** Response of loadOlderTimeline, loadNewerTimeline and jumpToLatestTimeline. The rows themselves arrive only through view.updated. */
export interface TimelineViewPageResponse {
  /** wire: `viewId`. Timeline view id. */
  viewId: string;
  /** wire: `loadedCount`. Rows this call added to the window. */
  loadedCount: number;
  /** wire: `revision`. Revision that contains this page (0 when the view was already closed). */
  revision: number;
}
