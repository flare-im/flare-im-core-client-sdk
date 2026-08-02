// GENERATED. Do not edit by hand.

/** Image/video/audio/file source descriptor (uuid, url, dimensions). */
export interface MediaSourceInfo {
  /** wire: `uuid`. Stable media uuid. */
  uuid?: string;
  /** wire: `imageId`. Image id when applicable. */
  imageId?: string;
  /** wire: `url`. Resolved URL. */
  url?: string;
  /** wire: `mimeType`. MIME type. */
  mimeType?: string;
  /** wire: `size`. Byte size. */
  size?: number;
  /** wire: `width`. Width in pixels. */
  width?: number;
  /** wire: `height`. Height in pixels. */
  height?: number;
  /** wire: `blurhash`. Blurhash placeholder for image previews. */
  blurhash?: string;
  /** wire: `durationMs`. Duration for audio/video. */
  durationMs?: number;
}
