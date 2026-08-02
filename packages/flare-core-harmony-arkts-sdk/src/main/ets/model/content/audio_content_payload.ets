// GENERATED. Do not edit by hand.
import { MediaSourceInfo } from '../media/media_source_info';

/** Audio message payload. */
export interface AudioContentPayload {
  /** wire: `audioId`. Uploaded audio id. */
  audioId?: string;
  /** wire: `source`. Audio source. */
  source?: MediaSourceInfo;
  /** wire: `durationMs`. Duration. */
  durationMs?: number;
}
