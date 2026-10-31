// GENERATED. Do not edit by hand.
import { ViewUpdate } from '../model';

/** View listener callbacks. */
export interface ViewEventListener {
  /** A core observable view changed: the next revision, as a delta or a snapshot. */
  onViewUpdated?(event: ViewUpdate): void;
}
