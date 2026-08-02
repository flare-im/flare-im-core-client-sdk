// GENERATED. Do not edit by hand.
import { ImageGroupContentPayload } from '../../../content/image_group_content_payload';

/** Build an image group message. */
export interface BuildImageGroupMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `payload`. Image group payload. */
  payload: ImageGroupContentPayload;
}
