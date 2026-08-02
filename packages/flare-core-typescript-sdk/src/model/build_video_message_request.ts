/** GENERATED. Do not edit by hand. */
import type { VideoContentPayload } from './video_content_payload';

/** Build a video message. */
export interface BuildVideoMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `videoId`. Uploaded video id. */
  videoId: string;
  /** wire: `payload`. Optional video payload. */
  payload?: VideoContentPayload;
}
