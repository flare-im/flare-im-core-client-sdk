/** GENERATED. Do not edit by hand. */
import type { EventCallback } from './common';
import type { ProgressEvent } from '../model';

/** Media listener callbacks. */
export interface MediaEventListener {
  /** Media upload progress changed. */
  onUploadProgress?(event: ProgressEvent): void;
  /** Media download progress changed. */
  onDownloadProgress?(event: ProgressEvent): void;
}
