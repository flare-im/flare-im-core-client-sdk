/** GENERATED. Do not edit by hand. */

/** Sticker message payload. */
export interface StickerContentPayload {
  /** wire: `stickerId`. Sticker id. */
  stickerId: string;
  /** wire: `packageId`. Sticker package id. */
  packageId?: string;
  /** wire: `url`. Sticker URL. */
  url?: string;
  /** wire: `width`. Width. */
  width?: number;
  /** wire: `height`. Height. */
  height?: number;
  /** wire: `format`. webp/gif/png. */
  format?: string;
}
