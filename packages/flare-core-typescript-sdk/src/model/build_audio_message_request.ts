/** GENERATED. Do not edit by hand. */
import type { AudioContentPayload } from './audio_content_payload';

/** Build an audio message. */
export interface BuildAudioMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `audioId`. Uploaded audio id. */
  audioId: string;
  /** wire: `payload`. Optional audio payload. */
  payload?: AudioContentPayload;
}
