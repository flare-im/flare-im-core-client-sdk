/** GENERATED. Do not edit by hand. */

/** Build a rich document message. */
export interface BuildRichDocMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `docJson`. RichDoc JSON document. */
  docJson: string;
  /** wire: `contentSchema`. Content schema, normally rich_doc. */
  contentSchema: string;
  /** wire: `plainText`. Human-readable plain text. */
  plainText: string;
  /** wire: `inputFormat`. Original source format when known. */
  inputFormat?: string;
  /** wire: `inputFormatVersion`. Original source format version. */
  inputFormatVersion?: number;
  /** wire: `sourcePayload`. Original source payload snapshot keyed by format. */
  sourcePayload?: Record<string, string>;
  /** wire: `title`. Rich document title. */
  title?: string;
  /** wire: `searchText`. Search-indexable text. */
  searchText?: string;
  /** wire: `renderHintsJson`. Renderer hints JSON. */
  renderHintsJson?: string;
}
