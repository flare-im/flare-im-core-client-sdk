// GENERATED. Do not edit by hand.
import { StickerContentPayload } from '../../../content/sticker_content_payload';

/** Build a sticker message. */
export interface BuildStickerMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `stickerId`. Sticker id. */
  stickerId: string;
  /** wire: `packageId`. Sticker package id. */
  packageId?: string;
  /** wire: `payload`. Optional sticker payload. */
  payload?: StickerContentPayload;
}
