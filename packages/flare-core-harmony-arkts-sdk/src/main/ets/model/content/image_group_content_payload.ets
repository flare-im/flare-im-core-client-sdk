// GENERATED. Do not edit by hand.
import { ImageGroupItem } from './image_group_item';

/** Image group payload. */
export interface ImageGroupContentPayload {
  /** wire: `images`. Grouped images. */
  images: Array<ImageGroupItem>;
  /** wire: `title`. Group title. */
  title?: string;
}
