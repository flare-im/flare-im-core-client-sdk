/** GENERATED. Do not edit by hand. */

/** Build a location message. */
export interface BuildLocationMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `latitude`. Latitude. */
  latitude: number;
  /** wire: `longitude`. Longitude. */
  longitude: number;
  /** wire: `title`. Place title. */
  title?: string;
  /** wire: `address`. Address. */
  address?: string;
}
