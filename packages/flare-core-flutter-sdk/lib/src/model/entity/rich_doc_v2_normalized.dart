// GENERATED. Do not edit by hand.

/// Normalized RichDoc v2 payload aligned with core NormalizeOutput.
final class RichDocV2Normalized {
  /// wire: `docJson`. Canonical RichDoc v2 JSON document.
  final String docJson;
  /// wire: `contentSchema`. Content schema, normally rich_doc.
  final String contentSchema;
  /// wire: `version`. RichDoc schema version.
  final int version;
  /// wire: `plainText`. Human-readable plain text extracted from the document.
  final String plainText;
  /// wire: `searchText`. Search-indexable text extracted from the document.
  final String searchText;
  /// wire: `renderHints`. Renderer hint object derived by core.
  final Map<String, Object?> renderHints;
  /// wire: `inputFormat`. Original source format when known.
  final String? inputFormat;
  /// wire: `sourcePayload`. Original source payload snapshot keyed by format.
  final Map<String, Object?>? sourcePayload;

  const RichDocV2Normalized({
    this.docJson = '',
    this.contentSchema = '',
    this.version = 0,
    this.plainText = '',
    this.searchText = '',
    this.renderHints = const {},
    this.inputFormat,
    this.sourcePayload,
  });
}
