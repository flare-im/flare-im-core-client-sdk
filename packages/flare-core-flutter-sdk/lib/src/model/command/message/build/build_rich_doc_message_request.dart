// GENERATED. Do not edit by hand.

/// Build a rich document message.
final class BuildRichDocMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `docJson`. RichDoc JSON document.
  final String docJson;
  /// wire: `contentSchema`. Content schema, normally rich_doc.
  final String contentSchema;
  /// wire: `plainText`. Human-readable plain text.
  final String plainText;
  /// wire: `inputFormat`. Original source format when known.
  final String? inputFormat;
  /// wire: `inputFormatVersion`. Original source format version.
  final int? inputFormatVersion;
  /// wire: `sourcePayload`. Original source payload snapshot keyed by format.
  final Map<String, String>? sourcePayload;
  /// wire: `title`. Rich document title.
  final String? title;
  /// wire: `searchText`. Search-indexable text.
  final String? searchText;
  /// wire: `renderHintsJson`. Renderer hints JSON.
  final String? renderHintsJson;

  const BuildRichDocMessageRequest({
    this.conversationId = '',
    this.docJson = '',
    this.contentSchema = '',
    this.plainText = '',
    this.inputFormat,
    this.inputFormatVersion,
    this.sourcePayload,
    this.title,
    this.searchText,
    this.renderHintsJson,
  });
}
