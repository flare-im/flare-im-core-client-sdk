// GENERATED. Do not edit by hand.
import { FileContentPayload } from '../../../content/file_content_payload';

/** Build a file message. */
export interface BuildFileMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `fileId`. Uploaded file id. */
  fileId: string;
  /** wire: `payload`. Optional file payload. */
  payload?: FileContentPayload;
}
