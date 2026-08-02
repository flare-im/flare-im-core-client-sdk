// GENERATED. Do not edit by hand.
import { MediaSourceInfo } from '../media/media_source_info';

/** Video message payload. */
export interface VideoContentPayload {
  /** wire: `videoId`. Uploaded video id. */
  videoId?: string;
  /** wire: `source`. Video source. */
  source?: MediaSourceInfo;
  /** wire: `cover`. Cover image. */
  cover?: MediaSourceInfo;
  /** wire: `description`. Caption. */
  description?: string;
}
