/** GENERATED. Do not edit by hand. */
import type { EventCallback } from './common';
import type { ViewUpdate } from '../model';

/** View listener callbacks. */
export interface ViewEventListener {
  /** A core observable view snapshot changed. */
  onViewUpdated?(event: ViewUpdate): void;
}
