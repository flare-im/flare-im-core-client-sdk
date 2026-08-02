package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a rich document message. */
data class BuildRichDocMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `docJson`. RichDoc JSON document. */
    val docJson: String = "",
    /** wire: `contentSchema`. Content schema, normally rich_doc. */
    val contentSchema: String = "",
    /** wire: `plainText`. Human-readable plain text. */
    val plainText: String = "",
    /** wire: `inputFormat`. Original source format when known. */
    val inputFormat: String? = null,
    /** wire: `inputFormatVersion`. Original source format version. */
    val inputFormatVersion: Int? = null,
    /** wire: `sourcePayload`. Original source payload snapshot keyed by format. */
    val sourcePayload: Map<String, String>? = null,
    /** wire: `title`. Rich document title. */
    val title: String? = null,
    /** wire: `searchText`. Search-indexable text. */
    val searchText: String? = null,
    /** wire: `renderHintsJson`. Renderer hints JSON. */
    val renderHintsJson: String? = null,
)
