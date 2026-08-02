/** GENERATED. Do not edit by hand. */
import type { ImageContentPayload } from './image_content_payload';

/** Build an image message. */
export interface BuildImageMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `imageId`. Uploaded image id. */
  imageId: string;
  /** wire: `payload`. Optional rich image payload for UI preview. */
  payload?: ImageContentPayload;
}
