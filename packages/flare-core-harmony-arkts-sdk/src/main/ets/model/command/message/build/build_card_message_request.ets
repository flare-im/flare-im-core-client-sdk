// GENERATED. Do not edit by hand.

/** Build a structured card message. */
export interface BuildCardMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `id`. Card target id. */
  id: string;
  /** wire: `cardType`. Card type key. */
  cardType?: string;
  /** wire: `title`. Display title. */
  title?: string;
  /** wire: `subtitle`. Display subtitle. */
  subtitle?: string;
  /** wire: `avatar`. Avatar URL or media id. */
  avatar?: string;
}
