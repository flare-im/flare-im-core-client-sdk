/** GENERATED. Do not edit by hand. */
import type { ImageGroupContentPayload } from './image_group_content_payload';

/** Build an image group message. */
export interface BuildImageGroupMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `payload`. Image group payload. */
  payload: ImageGroupContentPayload;
}
