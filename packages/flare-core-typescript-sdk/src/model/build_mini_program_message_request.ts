/** GENERATED. Do not edit by hand. */

/** Build a mini program message. */
export interface BuildMiniProgramMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `appId`. Mini program app id. */
  appId: string;
  /** wire: `pagePath`. Entry path. */
  pagePath?: string;
  /** wire: `title`. Display title. */
  title?: string;
  /** wire: `thumbnailUrl`. Thumbnail URL. */
  thumbnailUrl?: string;
  /** wire: `extra`. Mini program extension fields. */
  extra?: Record<string, string>;
}
