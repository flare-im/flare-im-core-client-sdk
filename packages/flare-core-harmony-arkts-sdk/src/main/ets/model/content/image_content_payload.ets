// GENERATED. Do not edit by hand.
import { MediaSourceInfo } from '../media/media_source_info';

/** Image message payload. */
export interface ImageContentPayload {
  /** wire: `imageId`. Uploaded image id. */
  imageId?: string;
  /** wire: `source`. Source descriptor. */
  source?: MediaSourceInfo;
  /** wire: `thumbnail`. Thumbnail descriptor. */
  thumbnail?: MediaSourceInfo;
  /** wire: `description`. Caption. */
  description?: string;
}
