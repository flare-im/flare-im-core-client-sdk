// GENERATED. Do not edit by hand.
import { ViewUpdate } from '../model';

/** View listener callbacks. */
export interface ViewEventListener {
  /** A core observable view snapshot changed. */
  onViewUpdated?(event: ViewUpdate): void;
}
