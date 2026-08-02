/** GENERATED. Do not edit by hand. */

/** Build a link card message. */
export interface BuildLinkCardMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `url`. Link URL. */
  url: string;
  /** wire: `title`. Card title. */
  title?: string;
  /** wire: `description`. Card description. */
  description?: string;
  /** wire: `thumbnailUrl`. Thumbnail URL. */
  thumbnailUrl?: string;
  /** wire: `siteName`. Site name. */
  siteName?: string;
}
