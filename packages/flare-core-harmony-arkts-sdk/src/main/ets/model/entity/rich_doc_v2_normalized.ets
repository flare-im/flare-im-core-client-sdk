// GENERATED. Do not edit by hand.

/** Normalized RichDoc v2 payload aligned with core NormalizeOutput. */
export interface RichDocV2Normalized {
  /** wire: `docJson`. Canonical RichDoc v2 JSON document. */
  docJson: string;
  /** wire: `contentSchema`. Content schema, normally rich_doc. */
  contentSchema: string;
  /** wire: `version`. RichDoc schema version. */
  version: number;
  /** wire: `plainText`. Human-readable plain text extracted from the document. */
  plainText: string;
  /** wire: `searchText`. Search-indexable text extracted from the document. */
  searchText: string;
  /** wire: `renderHints`. Renderer hint object derived by core. */
  renderHints: Record<string, Object>;
  /** wire: `inputFormat`. Original source format when known. */
  inputFormat?: string;
  /** wire: `sourcePayload`. Original source payload snapshot keyed by format. */
  sourcePayload?: Record<string, Object>;
}
